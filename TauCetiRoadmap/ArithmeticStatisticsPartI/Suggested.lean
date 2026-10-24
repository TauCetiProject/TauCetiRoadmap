import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Hom.Iso

/-!
# Arithmetic statistics, Part I: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for headline milestones; discharging
all of them finishes neither a layer nor the roadmap.

The targets stated here are integral quartic eligibility (§0.3), squarefree residue
counts (§0.6), the finite-field squarefree count (§0.9), the local maximal-order
proportion (§0.12), finiteness of unpolarized abelian-variety classes (§0.16), the
symmetric-pencil invariant ring and binary-form trace dual (§0.22), universal binary
Stickelberger congruences and monic local densities (§0.23), and the positive monic
Euler products and their degree limit (§0.24). The definitions are coefficient
polynomials, finite residue counts, native categorical isomorphism classes, and
submodules of native algebras.

The exact quadratic function-field slice parametrizations (§§0.11, 0.20) need the
extension discriminant divisor and the split or specified ramified infinity-localization
carriers. `RatFunc` and `AdjoinRoot` alone do not provide those objects. The positive
squareclass denominator (§0.15) needs the compatible local squareclass-specification
and support-height interface. These signatures are deferred until those interfaces exist.

The geometric bundle and theta-tail laws, adelic quotient volume and Hecke measure
(§§0.17–0.18) need the projective-line twisting sheaves, hyperelliptic pushforward and
section loci, and the function-field adelic bundle correspondence. Native finite locally
free sheaves and line-bundle classes do not supply these constructions. Principal
polarization counts and Honda–Tate classification (§0.16 and supporting constructions)
need the dual abelian variety, ample polarization and abelian Frobenius/Weil-number
interfaces; the native abelian-variety category does suffice for unpolarized finiteness.
Wood's rigid arithmetic fibres and reduced-multiplier refinements (§§0.19–0.21) need
marked extensions with their full split-infinity unramified groups and reduced covers.
These geometric and marked-arithmetic statements are deferred for those missing objects.
-/

noncomputable section
open scoped BigOperators Topology
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartI

/-- Ordinary binary quartic coefficients, in descending x-degree. -/
abbrev BinaryQuartic (R : Type*) := Fin 5 → R

namespace BinaryQuartic
variable {R : Type*} [CommRing R]

/-- The degree-two invariant in the ordinary coefficient convention. -/
def invI (f : BinaryQuartic R) : R := 12 * f 0 * f 4 - 3 * f 1 * f 3 + f 2 ^ 2

/-- The degree-three invariant in the ordinary coefficient convention. -/
def invJ (f : BinaryQuartic R) : R :=
  72 * f 0 * f 2 * f 4 + 9 * f 1 * f 2 * f 3 - 27 * f 0 * f 3 ^ 2
    - 27 * f 4 * f 1 ^ 2 - 2 * f 2 ^ 3

/-- Realizability by an integral form, with no irreducibility restriction. -/
def IsEligible (I J : ℤ) : Prop :=
  ∃ f : BinaryQuartic ℤ, invI f = I ∧ invJ f = J

/-- The four integral congruence cases of Bhargava–Shankar, Theorem 1.7. -/
def EligibilityCongruence (I J : ℤ) : Prop :=
  (I ≡ 0 [ZMOD 3] ∧ J ≡ 0 [ZMOD 27]) ∨
  (I ≡ 1 [ZMOD 9] ∧ (J ≡ 2 [ZMOD 27] ∨ J ≡ -2 [ZMOD 27])) ∨
  (I ≡ 4 [ZMOD 9] ∧ (J ≡ 16 [ZMOD 27] ∨ J ≡ -16 [ZMOD 27])) ∨
  (I ≡ 7 [ZMOD 9] ∧ (J ≡ 7 [ZMOD 27] ∨ J ≡ -7 [ZMOD 27]))

/-- §0.3: exactly these congruences characterize all realizable integral invariant pairs. -/
theorem isEligible_iff (I J : ℤ) : IsEligible I J ↔ EligibilityCongruence I J := by
  sorry

end BinaryQuartic

/-- §0.6: the squarefree progression count has a uniform square-root error at fixed modulus. -/
theorem SquarefreeFamily.squarefree_residue_count (q : ℕ) (hq : 0 < q) :
    ∃ Cq : ℝ, 0 ≤ Cq ∧ ∀ a : ℕ, Nat.Coprime a q → ∀ X : ℝ, 1 ≤ X →
      |(({n : ℕ | 0 < n ∧ (n : ℝ) ≤ X ∧ Squarefree n ∧ n % q = a % q}.ncard : ℝ) -
        ((6 / Real.pi ^ 2) / q *
          ∏ p ∈ q.primeFactors, (1 - 1 / (p : ℝ) ^ 2)⁻¹) * X)| ≤
        Cq * Real.sqrt X := by
  sorry

/-- The finite-field polynomial slice used to count quadratic function-field parameters. -/
def monicSquarefreePolysOfDegree (k : Type*) [Field k] (n : ℕ) : Set k[X] :=
  {f | f.Monic ∧ Squarefree f ∧ f.natDegree = n}

/-- §0.9: the exact squarefree-monic count in every degree at least two. -/
theorem card_monicSquarefreePolysOfDegree (k : Type*) [Field k] [Finite k]
    (n : ℕ) (hn : 2 ≤ n) :
    (monicSquarefreePolysOfDegree k n).Finite ∧
      (monicSquarefreePolysOfDegree k n).ncard = Nat.card k ^ n - Nat.card k ^ (n - 1) := by
  sorry

namespace Coefficients

/-- Monic coefficients descend from the coefficient of x^(n−1) to the constant term. -/
def monicPolynomial {R : Type*} [CommRing R] (n : ℕ) (a : Fin n → R) : R[X] :=
  X ^ n + ∑ i : Fin n, C (a i) * X ^ (n - 1 - i.val)

/-- Dehomogenization with the binary degree retained in the coefficient index. -/
def binaryPolynomial {R : Type*} [CommRing R] {n : ℕ} (a : Fin (n + 1) → R) : R[X] :=
  ∑ i, C (a i) * X ^ (n - i.val)

end Coefficients

/-- Evaluate the universal integer discriminant, before specializing its leading coefficient. -/
def binaryDisc {R : Type*} [CommRing R] (n : ℕ) (a : Fin (n + 1) → R) : R :=
  MvPolynomial.eval₂ (Int.castRingHom R) a
    (Coefficients.binaryPolynomial
      (fun i => MvPolynomial.X i : Fin (n + 1) → MvPolynomial (Fin (n + 1)) ℤ)).discr

/-- Exact valuation-j mass among all monic coefficient tuples modulo p^(j+1). -/
def monicProportion (n : ℕ) (p : ℕ+) (j : ℕ) : ℝ :=
  (Nat.card {a : Fin n → ZMod ((p : ℕ) ^ (j + 1)) //
    (p : ℤ) ^ j ∣ (Coefficients.monicPolynomial n (fun i => ((a i).val : ℤ))).discr ∧
    ¬ (p : ℤ) ^ (j + 1) ∣
      (Coefficients.monicPolynomial n (fun i => ((a i).val : ℤ))).discr} : ℝ) /
    (p : ℝ) ^ ((j + 1) * n)

/-- Dedekind's polynomial ideal obstruction, including separable reducible algebras. -/
def IsPMaximal (p : ℕ) (f : ℤ[X]) : Prop :=
  ∀ u : ℤ[X], u.Monic → Irreducible (u.map (Int.castRingHom (ZMod p))) →
    f ∉ Ideal.span {(C (p : ℤ)) ^ 2, C (p : ℤ) * u, u ^ 2}

/-- Local maximality is counted on the full monic residue space, without an irreducibility cut. -/
def pMaximalProportion (n : ℕ) (p : ℕ+) : ℝ :=
  (Nat.card {a : Fin n → ZMod ((p : ℕ) ^ 2) //
    IsPMaximal p (Coefficients.monicPolynomial n (fun i => ((a i).val : ℤ)))} : ℝ) /
    (p : ℝ) ^ (2 * n)

/-- §0.12: the exact local maximal-order proportion is independent of degree for n≥2. -/
theorem pMaximal_proportion (n : ℕ) (hn : 2 ≤ n) (p : ℕ+) (hp : Nat.Prime (p : ℕ)) :
    pMaximalProportion n p = 1 - 1 / (p : ℝ) ^ 2 := by
  sorry

/-- Native abelian varieties of fixed dimension, modulo isomorphism over the ground field. -/
abbrev UnpolarizedClasses (k : Type*) [Field k] (g : ℕ) :=
  Quotient (Setoid.comap
    (fun A : {A : TauCeti.AlgebraicGeometry.AbelianVariety k // A.dim = g} => A.val)
    (CategoryTheory.isIsomorphicSetoid _))

/-- §0.16: finitely many unpolarized isomorphism classes at fixed finite field and dimension. -/
theorem unpolarizedClasses_finite (k : Type*) [Field k] [Finite k] (g : ℕ) :
    Finite (UnpolarizedClasses k g) := by
  sorry

namespace ArithmeticOrbitRefinement

/-- Independent entries in a pair of symmetric matrices. -/
abbrev PencilVariables (n : ℕ) := Bool × Sym2 (Fin n)

/-- The coordinate ring of the full symmetric-pencil space over ℂ. -/
abbrev PencilRing (n : ℕ) := MvPolynomial (PencilVariables n) ℂ

/-- Either universal symmetric matrix, including its diagonal entries. -/
def universalSymmetric (n : ℕ) (s : Bool) : Matrix (Fin n) (Fin n) (PencilRing n) :=
  fun i j => MvPolynomial.X (s, Sym2.mk i j)

/-- Coefficients of the signed determinant, in descending x-degree. -/
def pencilCoefficient (n : ℕ) (i : Fin (n + 1)) : PencilRing n :=
  ((-1 : PencilRing n) ^ (n * (n - 1) / 2)) *
    (Matrix.det (fun r s => Polynomial.C (universalSymmetric n false r s) * Polynomial.X -
      Polynomial.C (universalSymmetric n true r s))).coeff (n - i.val)

/-- Pullback of coordinate polynomials under simultaneous congruence. -/
def pencilCongr (n : ℕ) (g : Matrix.SpecialLinearGroup (Fin n) ℂ) :
    PencilRing n →ₐ[ℂ] PencilRing n :=
  MvPolynomial.aeval (fun (s, ij) =>
    let h : Matrix (Fin n) (Fin n) (PencilRing n) := g.val.map MvPolynomial.C
    (h * universalSymmetric n s * h.transpose) ij.out.1 ij.out.2)

/-- §0.22: every SLₙ-invariant polynomial has a unique expression in the determinant
coefficients; this states generation and algebraic independence together. -/
theorem symmetricPencil_invariants (n : ℕ) (hn : 1 ≤ n) (P : PencilRing n)
    (hP : ∀ g : Matrix.SpecialLinearGroup (Fin n) ℂ, pencilCongr n g P = P) :
    ∃! Q : MvPolynomial (Fin (n + 1)) ℂ,
      MvPolynomial.aeval (pencilCoefficient n) Q = P := by
  sorry

variable {D L : Type*} [CommRing D] [CommRing L] [Algebra D L]

/-- The binary-order lattice generators ζᵢ, with the source's unscaled coefficients. -/
def zeta {n : ℕ} (f : Fin (n + 1) → D) (θ : L) (i : ℕ) : L :=
  ∑ j : Fin (n + 1), if j.val < i then algebraMap D L (f j) * θ ^ (i - j.val) else 0

/-- The underlying D-lattice of the binary-form order. -/
def formOrderModule {n : ℕ} (f : Fin (n + 1) → D) (θ : L) : Submodule D L :=
  Submodule.span D (Set.range (fun i : Fin n => if i.val = 0 then 1 else zeta f θ i.val))

/-- The lattice I_f(k) in the finite algebra generated by θ. -/
def formIdeal {n : ℕ} (f : Fin (n + 1) → D) (θ : L) (k : ℕ) : Submodule D L :=
  Submodule.span D ((fun i : ℕ => θ ^ i) '' {i | i ≤ k} ∪
    (zeta f θ) '' {i | k < i ∧ i < n})

/-- §0.22: the trace dual is f′(θ)⁻¹ I_f(n−2). The ambient finite algebra may be a
product of fields. Generation, the root relation and dimension identify it with K[t]/(f). -/
theorem formIdeal_traceDual [IsDedekindDomain D]
    {K : Type*} [Field K] [Algebra D K] [IsFractionRing D K]
    [Algebra K L] [IsScalarTower D K L] [FiniteDimensional K L]
    {n : ℕ} (hn : 3 ≤ n) (f : Fin (n + 1) → D) (hf : f 0 ≠ 0)
    (hdim : Module.finrank K L = n) (θ : L) (hgen : Algebra.adjoin K {θ} = ⊤)
    (hroot : Polynomial.aeval θ (Coefficients.binaryPolynomial f) = 0)
    (hsep : ((Coefficients.binaryPolynomial f).map (algebraMap D K)).Separable) (x : L) :
    (∀ y ∈ formOrderModule f θ, Algebra.trace K L (x * y) ∈ (algebraMap D K).range) ↔
    ∃ y ∈ formIdeal f θ (n - 2),
      x = Ring.inverse (Polynomial.aeval θ (Coefficients.binaryPolynomial f).derivative) * y := by
  sorry

end ArithmeticOrbitRefinement

/-- §0.23: Stickelberger's congruence for every integral binary form, including leading zeros. -/
theorem binaryDisc_mod_four (n : ℕ) (hn : 2 ≤ n) (a : Fin (n + 1) → ℤ) :
    binaryDisc n a % 4 = 0 ∨ binaryDisc n a % 4 = 1 := by
  sorry

/-- §0.23: the unit-discriminant local mass in arbitrary degree n≥2. -/
theorem monic_nu_zero (n : ℕ) (hn : 2 ≤ n) (p : ℕ+) (hp : Nat.Prime (p : ℕ)) :
    monicProportion n p 0 = 1 - 1 / (p : ℝ) := by
  sorry

/-- §0.23: the valuation-one residue count, with its prime-two and quadratic exceptions. -/
theorem monic_nu_one (n : ℕ) (hn : 2 ≤ n) (p : ℕ+) (hp : Nat.Prime (p : ℕ)) :
    monicProportion n p 1 =
      if (p : ℕ) = 2 then 0 else if n = 2 then (1 / (p : ℝ)) * (1 - 1 / (p : ℝ)) else
        (1 - 1 / (p : ℝ)) ^ 2 * (1 - (-(p : ℝ)) ^ (2 - (n : ℤ))) / ((p : ℝ) + 1) := by
  sorry

/-- The prime product of actual residue masses, rather than a product of candidate formulas. -/
def monicEulerProduct (n : ℕ) : ℝ :=
  ∏' p : Nat.Primes, (monicProportion n ⟨p, p.property.pos⟩ 0 +
    monicProportion n ⟨p, p.property.pos⟩ 1)

/-- §0.24: the local factors define a convergent, strictly positive Euler product. -/
theorem monicEulerProduct_converges_pos (n : ℕ) (hn : 2 ≤ n) :
    Multipliable (fun p : Nat.Primes => monicProportion n ⟨p, p.property.pos⟩ 0 +
      monicProportion n ⟨p, p.property.pos⟩ 1) ∧ 0 < monicEulerProduct n := by
  sorry

/-- §0.24: exchanging the degree limit and the prime product gives the limiting local constant. -/
theorem monicEulerProduct_limit :
    Tendsto monicEulerProduct atTop
      (nhds (∏' p : Nat.Primes, if (p : ℕ) = 2 then (1 / 2 : ℝ) else
        1 - (3 * (p : ℝ) - 1) / ((p : ℝ) ^ 2 * ((p : ℝ) + 1)))) := by
  sorry

end TauCetiRoadmap.ArithmeticStatisticsPartI
