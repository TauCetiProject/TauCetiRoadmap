import Mathlib
import TauCeti.AlgebraicGeometry.Modules.Stalk

/-!
# Algebraic moduli for arithmetic geometry: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The statements here suggest Lean forms for particular milestones; discharging all of
them finishes neither a layer nor the roadmap. Each `sorry` marks a theorem to prove.

The stated headlines are Hilbert–Serre over Artinian coefficient rings (§1.5), coherent dévissage
on Noetherian schemes (§2.3), faithful flatness of arbitrary commutative Hopf-algebra inclusions
(§4.22), and Artin approximation in its pointed étale and henselian forms (§6.1). Integer-graded modules retain negative generator degrees in
Hilbert–Serre. Choosing degree-one algebra generators puts every standard finite-type graded
algebra in the polynomial-ring formulation below. Geometric regularity of formal fibres and the
approximation property have real definitions on Mathlib's rings, residue fields and completions.

The geometric headlines need carriers beyond the pins. Layer 1's projective-bundle universal
property and cohomology, coherent Grassmannians and flags, uniform regularity and boundedness
need relative projective bundles with twists, relative ampleness and coherent Hilbert polynomials.
Layer 2's Hom and automorphism representability need the corresponding parameter functors.
Layer 3's effective descent on algebraic
spaces and algebraicity of relative Hom and Weil restriction need algebraic spaces and their
ringed étale sites. Layer 4's derived H² classification, neutrality criterion and profinite-gerbe
comparisons need banded gerbes, their band-preserving equivalence classes and derived class map;
Mathlib's stack predicate and sheaf cohomology alone do not provide these constructions. Layer 5's
rigidification and level removal need algebraic stacks, inertia subgroups and quotient stacks.
The other Layer 6 formulations need henselizations and excellent coefficient rings.
Layer 7's Artin criteria, Picard representability, group-space components, proper GAGA and
cofinite coefficient cohomology need algebraic spaces, Picard sheaves, module obstruction theories,
nonarchimedean analytification and relative coherent cohomology comparisons. Layer 8's formal
effectivity, versality and algebraization need framed deformation and formal-object groupoids.
Layer 9's resolution comparisons, Kawamata–Viehweg vanishing and Kollár–Matsusaka boundedness need
the supplied resolution/SNC interfaces, logarithmic complexes, nef and big divisors and intersection
theory. These headlines have no substitute statements here.
-/

namespace TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

universe u v w

namespace ProjectiveParameterSpaces

/-- Hilbert–Serre (README §1.5): a finite integer-graded module over a standard polynomial ring
has finite-length pieces, vanishes in sufficiently negative degrees, and has Hilbert series
`h(T)/(1-T)^e` after a shift. Its eventual length polynomial has degree less than `e`, the number
of variables. The grading compatibility uses Mathlib's homogeneous polynomial submodules. -/
theorem hilbertSerre (A : Type u) [CommRing A] [IsArtinianRing A]
    (σ : Type v) [Fintype σ] (M : Type w) [AddCommGroup M] [Module A M]
    [Module (MvPolynomial σ A) M] [IsScalarTower A (MvPolynomial σ A) M]
    [Module.Finite (MvPolynomial σ A) M]
    (ℳ : ℤ → Submodule A M) [DirectSum.Decomposition ℳ]
    (hgraded : ∀ (i : ℕ) (j : ℤ) (p : MvPolynomial σ A),
      p ∈ MvPolynomial.homogeneousSubmodule σ A i →
        ∀ m ∈ ℳ j, p • m ∈ ℳ (j + i)) :
    (∀ d, Module.Finite A (ℳ d) ∧ Module.length A (ℳ d) ≠ ⊤) ∧
      ∃ (d₀ : ℤ) (h : Polynomial ℤ) (P : Polynomial ℚ) (N : ℤ),
        (∀ d < d₀, ℳ d = ⊥) ∧
        (PowerSeries.mk (fun n : ℕ =>
          ((Module.length A (ℳ (d₀ + n))).toNat : ℤ))) *
          (1 - PowerSeries.X) ^ Fintype.card σ = h.toPowerSeries ∧
        P.degree < (Fintype.card σ : WithBot ℕ) ∧
        ∀ d, N ≤ d → P.eval (d : ℚ) = ((Module.length A (ℳ d)).toNat : ℚ) := sorry

end ProjectiveParameterSpaces

open CategoryTheory AlgebraicGeometry in
/-- Coherent dévissage (README §2.3): on a Noetherian scheme, a property of module sheaves holds
for every coherent sheaf once it holds for zero sheaves, satisfies two-out-of-three in short exact
sequences of coherent sheaves, and holds for one coherent sheaf supported on each irreducible
closed subset `Z` whose stalk at the generic point of `Z` has length one, that is, is the residue
field. Coherent means finitely presented; the support is the set of points with nonzero stalk. -/
theorem coherentDevissage (X : Scheme.{u}) [IsNoetherian X] (P : X.Modules → Prop)
    (hzero : ∀ F : X.Modules, Limits.IsZero F → P F)
    (hexact : ∀ S : ShortComplex X.Modules, S.ShortExact →
      S.X₁.IsFinitePresentation → S.X₂.IsFinitePresentation → S.X₃.IsFinitePresentation →
        (P S.X₁ → P S.X₂ → P S.X₃) ∧ (P S.X₁ → P S.X₃ → P S.X₂) ∧
          (P S.X₂ → P S.X₃ → P S.X₁))
    (hgeneric : ∀ (Z : Set X) (ξ : X), IsClosed Z → IsIrreducible Z → IsGenericPoint ξ Z →
      ∃ G : X.Modules, G.IsFinitePresentation ∧
        {x : X | Nontrivial (G.presheaf.stalk x)} = Z ∧
        Module.length (X.presheaf.stalk ξ) (G.presheaf.stalk ξ) = 1 ∧ P G)
    (F : X.Modules) [F.IsFinitePresentation] : P F := sorry

/-- Every inclusion of commutative Hopf algebras over a field is faithfully flat (README §4.22).
There are no finite-type, reducedness, perfection or characteristic assumptions. -/
theorem hopfInclusion_faithfullyFlat {k : Type u} [Field k]
    {A : Type v} [CommRing A] [HopfAlgebra k A]
    {B : Type w} [CommRing B] [HopfAlgebra k B]
    (f : A →ₐc[k] B) (hf : Function.Injective f) :
    f.toAlgHom.toRingHom.FaithfullyFlat := sorry

namespace Approximation

open scoped TensorProduct

/-- Geometric regularity of the fibres of `A → Â`: after every finite extension of every prime
residue field the fibre is a regular ring. For Noetherian local `A`, flatness of completion makes
this the regular-completion-map hypothesis in Artin approximation (README §6.1). -/
def HasGeometricallyRegularFormalFibres (A : Type u) [CommRing A] [IsLocalRing A] : Prop :=
  ∀ (p : Ideal A) [p.IsPrime] (L : Type u) [Field L]
    [Algebra p.ResidueField L] [FiniteDimensional p.ResidueField L],
    IsRegularRing (L ⊗[p.ResidueField]
      (p.ResidueField ⊗[A] AdicCompletion (IsLocalRing.maximalIdeal A) A))

/-- The approximation property (README §6.0): each formal solution of finitely many equations
can be approximated to every order by a solution in the original local ring. -/
def HasArtinApproximation (A : Type u) [CommRing A] [IsLocalRing A] : Prop :=
  ∀ (B : Type u) [CommRing B] [Algebra A B], Algebra.FinitePresentation A B →
    ∀ (φ : B →ₐ[A] AdicCompletion (IsLocalRing.maximalIdeal A) A) (n : ℕ),
      ∃ ψ : B →ₐ[A] A, ∀ b : B,
        φ b - algebraMap A (AdicCompletion (IsLocalRing.maximalIdeal A) A) (ψ b) ∈
          (Ideal.map (algebraMap A (AdicCompletion (IsLocalRing.maximalIdeal A) A))
            (IsLocalRing.maximalIdeal A)) ^ n

/-- Artin approximation through a pointed étale neighbourhood (README §6.1, Stacks 07QZ).
The map `ι : S → Â` specifies the point: composing with `AdicCompletion.evalOneₐ` gives the
surjective residue-field map `S → A/𝔪`, so its kernel has residue field `A/𝔪`. -/
theorem polynomial_approximation (A : Type u) [CommRing A] [IsLocalRing A]
    [IsNoetherianRing A] (hformal : HasGeometricallyRegularFormalFibres A)
    (B : Type u) [CommRing B] [Algebra A B] [Algebra.FinitePresentation A B]
    (φ : B →ₐ[A] AdicCompletion (IsLocalRing.maximalIdeal A) A) (n : ℕ) :
    ∃ (S : Type u) (_ : CommRing S) (_ : Algebra A S) (_ : Algebra.Etale A S)
      (ι : S →ₐ[A] AdicCompletion (IsLocalRing.maximalIdeal A) A) (ψ : B →ₐ[A] S),
      ∀ b : B, φ b - ι (ψ b) ∈
        (Ideal.map (algebraMap A (AdicCompletion (IsLocalRing.maximalIdeal A) A))
          (IsLocalRing.maximalIdeal A)) ^ n := sorry

/-- Henselian Artin approximation (README §6.1, Stacks 07QY): geometric regularity of formal
fibres suffices for approximation inside a henselian Noetherian local ring itself. -/
theorem artinApproximation (A : Type u) [CommRing A] [IsNoetherianRing A] [HenselianLocalRing A]
    (hformal : HasGeometricallyRegularFormalFibres A) : HasArtinApproximation A := sorry

end Approximation

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry
