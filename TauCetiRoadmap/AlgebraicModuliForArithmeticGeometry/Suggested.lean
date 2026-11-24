import Mathlib
import TauCeti.AlgebraicGeometry.Cohomology.EulerCharacteristic
import TauCeti.AlgebraicGeometry.LineBundle.Ample
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.LineBundle.Functoriality
import TauCeti.AlgebraicGeometry.LineBundle.NonvanishingLocus
import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct
import TauCeti.AlgebraicGeometry.Modules.Differentials.Rank
import TauCeti.AlgebraicGeometry.Modules.Stalk
import TauCeti.AlgebraicGeometry.ProjectiveSpectrum.ProjectiveOver
import TauCeti.AlgebraicGeometry.VectorBundle.Determinant.Basic

/-!
# Algebraic moduli for arithmetic geometry: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The statements here suggest Lean forms for particular milestones; discharging all of
them finishes neither a layer nor the roadmap. Each `sorry` marks a theorem to prove.

The stated headlines are Hilbert–Serre over Artinian coefficient rings (§1.5), coherent dévissage
on Noetherian schemes (§2.3), faithful flatness of arbitrary commutative Hopf-algebra inclusions
(§4.22), Artin approximation in its pointed étale and henselian forms (§6.1), and the Angehrn–Siu
separation of points by adjoint bundles on a smooth projective complex variety (§9.12c). The last
needs two definitions: the intersection numbers `(L^d · Z)`, which `PointSeparation.selfIntersection`
computes as the `d`-th difference of `m ↦ χ(Z, L^m)`, and the canonical bundle `det Ω_{X/k}`,
`PointSeparation.canonicalBundle`. Integer-graded modules retain negative generator degrees in
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
theory. Its theorems on pairs, namely Nadel vanishing for pairs (§9.10c), the isolated non-klt
centre theorem (§9.12), and Kollár's global generation and two-point separation for klt pairs
(§§9.12a–9.12b), need the canonical divisor of a normal variety, the `ℚ`-Cartier condition with
pullback along proper birational morphisms, discrepancies over all normal birational models, nef and
big `ℚ`-Cartier divisors and the multiplier ideal of a pair; the Ein–Lazarsfeld global division
theorem (§9.13) needs the multiplier ideals of an ideal and nef and big divisors. The pins have
Mathlib's `ℚ`-valued algebraic cycles and Tau Ceti's Weil and Cartier divisors, but none of these.
These headlines have no substitute statements here.
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

namespace PointSeparation

open AlgebraicGeometry CategoryTheory TauCeti.AlgebraicGeometry

/-- The intersection number `(a^r · X)` of a line-bundle class `a` on a scheme `X` over a field `K`
with `X` itself (README §9.12c), as the `r`-th difference
`Σ_{j=0}^{r} (−1)^{r−j} binom(r, j) χ(X, a^j)` of the Euler characteristic, `χ` being Tau Ceti's
`Scheme.Modules.eulerCharBelow` truncated at `r + 1`. For `X` projective over `K` of dimension `r`
the cohomology vanishes above degree `r`, `m ↦ χ(X, a^m)` is a polynomial of degree at most `r`,
and this difference is `r!` times its coefficient of `m^r`, which is the degree of `c_1(a)^r ∩ [X]`
(Stacks, Definition 33.45.3, tag 0BEP). For `r = 1` it is `χ(a) − χ(O_X)`. -/
noncomputable def selfIntersection (K : Type u) [Field K] (X : Scheme.{u}) [X.Over (Spec (.of K))]
    (r : ℕ) (a : LineBundleClass X) : ℤ :=
  ∑ j ∈ Finset.range (r + 1), (-1 : ℤ) ^ (r - j) * (r.choose j : ℤ) *
    LineBundleClass.lift (fun L ↦ Scheme.Modules.eulerCharBelow K X L.obj (r + 1))
      (fun _ _ ⟨e⟩ ↦ Scheme.Modules.eulerCharBelow_congr K e (r + 1)) (a ^ j)

/-- The canonical bundle `K_X = det Ω_{X/k}` of a scheme `X` smooth of relative dimension `n` over
a field `k` (README §9.12c): the determinant of the locally free sheaf of relative differentials,
of rank `n`. It is not Tau Ceti's `TauCeti.AlgebraicGeometry.InvertibleSheaf.canonicalBundle`, a
line bundle on a curve built from the divisor of a Weil differential. -/
noncomputable def canonicalBundle (k : Type u) [Field k] (X : Scheme.{u}) [X.Over (Spec (.of k))]
    (n : ℕ) [SmoothOfRelativeDimension n (X ↘ Spec (.of k))] : InvertibleSheaf X :=
  haveI := SmoothOfRelativeDimension.smooth n (X ↘ Spec (.of k))
  (FiniteLocallyFreeSheaf.determinant X n).obj
    ⟨FiniteLocallyFreeSheaf.relativeDifferentials k X,
      fun x ↦ FiniteLocallyFreeSheaf.rank_relativeDifferentials_apply k n x⟩

/-- **Separation of points for adjoint bundles** (Angehrn–Siu 1995, Theorem 0.3; README §9.12c).
Let `X` be a smooth projective variety over `ℂ` of dimension `n`, `L` an ample line bundle on `X`
and `x_1, …, x_ℓ` distinct closed points of `X`. If `(L^d · Z) > (½n(n + 2ℓ − 1))^d` for every
closed integral subscheme `Z` of `X` of dimension `d ≥ 1` (`Z = X` included), then for every `i`
the adjoint bundle `K_X ⊗ L` has a global section that is nonzero at `x_i` and vanishes at every
`x_j` with `j ≠ i`. As every residue field `ℂ(x_i)` is `ℂ`, this is the surjectivity of
`H⁰(X, K_X ⊗ L) → ⊕_i (K_X ⊗ L) ⊗ ℂ(x_i)`. -/
theorem angehrnSiuPointSeparation (X : Scheme.{0}) [X.Over (Spec (.of ℂ))] [IsIntegral X]
    [X.IsProjectiveOver ℂ] (n : ℕ) [SmoothOfRelativeDimension n (X ↘ Spec (.of ℂ))]
    (L : InvertibleSheaf X) (hL : (LineBundleClass.mk L).IsAmple)
    (ℓ : ℕ) (x : Fin ℓ → X) (hx : Function.Injective x) (hcl : ∀ i, IsClosed ({x i} : Set X))
    (hZ : ∀ (Z : Scheme.{0}) [Z.Over (Spec (.of ℂ))] [IsIntegral Z] (ι : Z ⟶ X)
      [IsClosedImmersion ι] [ι.IsOver (Spec (.of ℂ))] (d : ℕ), 1 ≤ d →
      topologicalKrullDim Z = d →
      ((n * (n + 2 * ℓ - 1) : ℚ) / 2) ^ d <
        selfIntersection ℂ Z d (LineBundleClass.pullback ι (LineBundleClass.mk L))) :
    ∀ i, ∃ s : Γ((InvertibleSheaf.tensorProduct (canonicalBundle ℂ X n) L).obj, ⊤),
      x i ∈ (InvertibleSheaf.tensorProduct (canonicalBundle ℂ X n) L).obj.nonvanishingLocus s ∧
      ∀ j, j ≠ i →
        x j ∉ (InvertibleSheaf.tensorProduct (canonicalBundle ℂ X n) L).obj.nonvanishingLocus s := by
  sorry

end PointSeparation

end TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry
