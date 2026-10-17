import Mathlib
import TauCeti.RingTheory.Huber.Restricted.TwoSidedSeries.Convolution

/-!
# PadicHodgeTheory: representative target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive
specification is `README.md`. These are suggested forms: definitions and theorem
signatures statable against the pinned Mathlib and Tau Ceti APIs.
The anonymous analytic coefficient formulas describe the supplied
PadicDifferentialEquationsAndRigidCohomology interface without defining another
convergence predicate, Gauss norm or analytic carrier. Laurent multiplication
uses genuine discrete convolution. Field periods and their geometric structures
are imported from the lower owners named in the README.
Coordinate matrices fix covariant Tate periods, negative-derivative monodromy
and arithmetic Weil Frobenius. Rational supremum estimates carry convergence
and positive-radius hypotheses. No matrix formula asserts existence of a
period representation.
-/

noncomputable section

open Filter Matrix
open scoped Topology DiscreteConvolution

namespace TauCetiRoadmap.PadicHodgeTheory

/-! ## Layer 0: Rational period rings -/

/-- The exponent two is a nonunit in the dyadic integers. -/
example : ¬ IsUnit (2 : ℤ_[2]) := by
  sorry

/-- Scaling a nonzero period by two gives a proper dyadic sublattice;
these spans test its scalar coordinates inside the dyadic field. -/
example : Submodule.span ℤ_[2] ({(2 : ℚ_[2])} : Set ℚ_[2]) ≠
    Submodule.span ℤ_[2] ({(1 : ℚ_[2])} : Set ℚ_[2]) := by
  sorry

/-- A normalized trace fixes one in a degree-two step, including the 2-adic tower. -/
example : (1 / 2 : ℚ) * 2 = 1 ∧ (2 : ℚ) ≠ 1 := by
  norm_num

/-- A theta-kernel element and its translate by p have different theta images.
This checks the kernel-membership hypothesis independently of reduction modulo p. -/
example {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S)
    (p : ℕ) (x : R) (hx : f x = 0) (hp : (p : S) ≠ 0) :
    f (x + p) = (p : S) ∧ f (x + p) ≠ 0 := by
  simp [hx, hp]

/-!
README §0.4's `dividedFrobenius_dyadic_generators` uses xi-two = 1 + [epsilon^(1/2)]
and T = t/2. Its closed A_inf-span consists of xi-two^j gamma_n(T), j+n ≥ r.
The trace coordinate pi-zero = [epsilon] + [epsilon]^(-1) - 2 instead gives
q-prime = [epsilon^(1/2)] + [epsilon^(-1/2)], whose theta image is -2.
The corrected primitive generator has theta image zero and Frobenius image
xi-two^2 - 2 xi-two + 2, divisible by 2 in A_cris.
-/

/-- Theta sends the trace-based dyadic candidate to minus two and the primitive generator to zero. -/
example {R S : Type*} [CommRing R] [CommRing S] [CharZero S]
    (theta : R →+* S) (a b : R) (ha : theta a = -1) (hb : theta b = -1) :
    theta (a + b) = -2 ∧ theta (a + b) ≠ 0 ∧ theta (1 + a) = 0 := by
  norm_num [ha, hb]

/-- The Frobenius polynomial of the primitive dyadic generator is twice its divided expression. -/
example (x : ℚ) : x ^ 2 - 2 * x + 2 = 2 * (1 - x + x ^ 2 / 2) := by
  ring

/-- At p = 2 the iterated divided powers obey delta-zero squared = 2 delta-one. -/
example (x : ℚ) : (x ^ 2 / 2) ^ 2 = 2 * (x ^ 4 / 8) := by
  ring

/-- Raw series coefficients are not independent modulo the relation 2T = xi. -/
example : Polynomial.eval (3 / 2 : ℚ)
    (Polynomial.C 3 - Polynomial.C 2 * Polynomial.X) = 0 ∧ (3 : ℚ) ≠ 0 := by
  norm_num

/-- Breuil's integral monodromy is (1+X) times the derivative, before rescaling. -/
example : ((1 + Polynomial.X : Polynomial ℚ) *
    Polynomial.derivative ((1 + Polynomial.X) ^ 2 - 1)) =
    Polynomial.C 2 * (1 + Polynomial.X) ^ 2 := by
  rw [Polynomial.derivative_sub, Polynomial.derivative_pow]
  norm_num
  ring

/-- Absolute monodromy negates Breuil's operator and divides by the ramification index. -/
example : -Polynomial.C (1 / 2 : ℚ) * (1 + Polynomial.X) *
    Polynomial.derivative Polynomial.X =
    -Polynomial.C (1 / 2 : ℚ) * (1 + Polynomial.X) := by
  simp

/-- Scaling N by c = -2 divides its connecting map by -2; transport back multiplies by c. -/
example (b : ℚ) : (-2 : ℚ) * ((-2 : ℚ)⁻¹ * b) = b := by
  ring

/-- In a characteristic-two PD ideal, every element has zero square. -/
example {R : Type*} [CommRing R] [CharP R 2] (I : Ideal R)
    (hI : DividedPowers I) (x : R) (hx : x ∈ I) : x ^ 2 = 0 := by
  have hpow := hI.factorial_mul_dpow_eq_pow (n := 2) hx
  simpa [Nat.factorial, show (2 : R) = 0 from CharP.cast_eq_zero R 2] using hpow.symm

/-- A PD variable in characteristic two is not an ordinary polynomial variable. -/
example : (Polynomial.X : Polynomial (ZMod 2)) ^ 2 ≠ 0 := by
  exact pow_ne_zero _ Polynomial.X_ne_zero


/-- The first two logarithm terms fix the negative polynomial-derivative convention. -/
example : -Polynomial.derivative
    (Polynomial.X - Polynomial.C (1/2 : ℚ) * Polynomial.X ^ 2) =
    -1 + Polynomial.X := by
  sorry

/-- On a two-term truncation, u maps to xi/p minus xi squared over twice p squared. -/
example : Polynomial.derivative
    (Polynomial.C (1/2 : ℚ) * Polynomial.X -
      Polynomial.C (1/8 : ℚ) * Polynomial.X ^ 2) =
    Polynomial.C (1/2 : ℚ) - Polynomial.C (1/4 : ℚ) * Polynomial.X := by
  sorry

/-! ## Layer 1: Supplied analytic coefficients

PadicDifferentialEquationsAndRigidCohomology §§RD.0.1–RD.0.2 owns the analytic
carriers, Gauss norms and topologies. These anonymous formulas express their
coefficient conventions and radius-one agreement with the pinned convolution.
-/

section AnalyticCoefficients

variable {K : Type*} [NormedField K]

/-- At a positive convergence radius the supplied Gauss supremum bounds every coefficient. -/
example {a : ℤ → K} {ρ : ℝ} (hρ : 0 < ρ)
    (ha : Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n) cofinite (𝓝 0)) (n : ℤ) :
    ‖a n‖ * ρ ^ n ≤ ⨆ m : ℤ, ‖a m‖ * ρ ^ m := by
  sorry

/-- Radius-one convergence agrees with the existing restricted-series submodule. -/
example (a : ℤ → K) :
    Tendsto (fun n : ℤ => ‖a n‖ * (1 : ℝ) ^ n) cofinite (𝓝 0) ↔
      a ∈ TauCeti.Huber.twoSidedRestrictedSubmodule K K := by
  sorry

/-- Finite Laurent support converges at every positive radius. -/
example {ρ : ℝ} (hρ : 0 < ρ) (m : ℤ) (c : K) :
    Tendsto (fun n : ℤ => ‖(if n = m then c else 0 : K)‖ * ρ ^ n)
      cofinite (𝓝 0) := by
  sorry

/-- Geometric coefficients converge strictly inside the unit circle. -/
example {ρ : ℝ} (hρ : 0 < ρ) (hρ1 : ρ < 1) :
    Tendsto (fun n : ℤ => ‖(if 0 ≤ n then 1 else 0 : K)‖ * ρ ^ n)
      cofinite (𝓝 0) := by
  sorry

/-- The same geometric coefficients fail convergence at radius one. -/
example : ¬ Tendsto
    (fun n : ℤ => ‖(if 0 ≤ n then 1 else 0 : K)‖ * (1 : ℝ) ^ n)
      cofinite (𝓝 0) := by
  sorry

/-- The two opposite Laurent monomials have the maximum of their radius norms. -/
example {ρ : ℝ} (hρ : 0 < ρ) :
    (⨆ n : ℤ, ‖(if n = -1 ∨ n = 1 then 1 else 0 : K)‖ * ρ ^ n) =
      max ρ ρ⁻¹ := by
  sorry

variable [CompleteSpace K] [IsUltrametricDist K]

/-- The supplied Gauss supremum is multiplicative for convergent convolution. -/
example {a b : ℤ → K} {ρ : ℝ} (hρ : 0 < ρ)
    (ha : Tendsto (fun n : ℤ => ‖a n‖ * ρ ^ n) cofinite (𝓝 0))
    (hb : Tendsto (fun n : ℤ => ‖b n‖ * ρ ^ n) cofinite (𝓝 0)) :
    (⨆ n : ℤ, ‖(a ⋆ᵣ₊ b) n‖ * ρ ^ n) =
      (⨆ n : ℤ, ‖a n‖ * ρ ^ n) * (⨆ n : ℤ, ‖b n‖ * ρ ^ n) := by
  sorry

/-- A ring map cannot evaluate an annular unit to zero in a nonzero ring. -/
example {R S : Type*} [CommRing R] [CommRing S] [Nontrivial S]
    (f : R →+* S) (u : Rˣ) : f (u : R) ≠ 0 := by
  exact (u.isUnit.map f).ne_zero

end AnalyticCoefficients

/-! ## Layer 2: Local period sheaves -/

/-- A Teichmüller lift is a unit when its untilt is a unit, provided theta is
surjective and its source is complete for the theta kernel. -/
theorem deRhamTeichmuller_isUnit {B R X : Type*} [CommRing B] [CommRing R]
    (theta : B →+* R) (hTheta : Function.Surjective theta)
    [IsAdicComplete (RingHom.ker theta) B]
    (teichmuller : X → B) (untilt : X → R)
    (hTeichmuller : ∀ x, theta (teichmuller x) = untilt x)
    (x : X) (hx : IsUnit (untilt x)) : IsUnit (teichmuller x) := by
  sorry

/-- A nonzero untilt on a product chart can be a nonunit. -/
example : ((1, 0) : ℚ × ℚ) ≠ 0 ∧ ¬ IsUnit ((1, 0) : ℚ × ℚ) := by
  simp [Prod.isUnit_iff, Prod.ext_iff]

/-- The toric logarithm of the ordered quotient has positive translation. -/
example : Polynomial.comp (Polynomial.X : Polynomial ℚ) (Polynomial.X + 1) -
    Polynomial.X = 1 := by
  sorry

/-- The boundary attached to a two-line connection is minus its connection matrix. -/
example : (- (!![(0 : ℚ), 0; 1, 0])) *ᵥ ![1, 0] = ![0, -1] := by
  sorry

/-- At a crossing of two boundary components the alternating simplex differential squares to zero. -/
example (x : ℚ) : (LinearMap.fst ℚ ℚ ℚ - LinearMap.snd ℚ ℚ ℚ) (x, x) = 0 := by
  simp

/-! ## Layer 3: Filtered period functors -/

/-!
README §3.6's `RegularOrdinary` abbreviates LocalGaloisDeformationRings §1.7's
`IsOrdinaryOfWeight` with coefficient algebra `A = E`. Here K and E are finite
extensions of Q_p, E contains all embeddings of K, V is a continuous n-dimensional
E-representation of G_K, and the integral labels satisfy
λ_(τ,1) ≥ ⋯ ≥ λ_(τ,n). The supplied increasing stable full flag has rank-one
graded characters ψ_i satisfying
ψ_i(Art_K^geom(u)) = ∏_τ τ(u)^(-(λ_(τ,n-i+1) + i - 1))
on an open subgroup of O_K^×. Over E every subspace is a direct summand.
Dominance makes the labelled weights strictly ordered; finite-order inertia is allowed.
The supplied graded-character, restriction, dual/twist and rank-two dictionaries
give `regularOrdinary_graded`, `regularOrdinary_restrict` and `regularOrdinary_rank_two`.
Flag uniqueness uses the distinct ordered inertial characters. The slope, monodromy
and finite-extension descent comparisons are the targets of §3.6. For the crystalline
slope equivalence, assume for each embedding τ that gr^i D_dR,τ(V) has E-dimension
one exactly at i = λ_(τ,j) + n - j and zero elsewhere. Under this prescribed Hodge
type, regular ordinarity of weight λ is equivalent to the descending valuations
v_K(alpha_i) = ∑_τ (λ_(τ,i) + n - i) of phi^f, with v_K(p) = e_K.
With jumps -1 and 2 and intermediate line E(e+f), phi = diag(1,p) instead realizes
an irreducible crystalline representation with valuations (1,0); its Hodge type
excludes the weight-zero equivalence.
README §3.4's `filteredHodge_supermodular` compares ambient induced filtrations:
t_H(A) + t_H(B) ≤ t_H(A ∩ B) + t_H(A + B). Newton numbers are additive.
For the two eigenlines and Fil^1 = E(e+f), the Hodge inequality is strict, 0 < 1.
The quotient filtration on their sum differs from the ambient induced filtration.
-/

/-- A Tate-line period of exponent minus one has filtration jump minus one. -/
example : ((-1 : ℤ) + 1 = 0) ∧ -(-1 : ℤ) = 1 := by
  decide

/-- The dual filtration uses the annihilator of step one minus the index. -/
example (i r : ℤ) : ¬ (1 - i ≤ r) ↔ i ≤ -r := by
  omega

/-- Shifting the filtration by one lowers its jump by one. -/
example (i r : ℤ) : i + 1 ≤ r ↔ i ≤ r - 1 := by
  omega

/-- Arithmetic Artin inverts units under the cyclotomic character;
the coefficient 2 becomes one half, and geometric Artin inverts again. -/
example : (2 : ℚ)⁻¹ = 1/2 ∧ ((2 : ℚ)⁻¹)⁻¹ = 2 := by
  norm_num

/-! ## Layer 4: Robba realizations and Herr signs -/

/-- Swapping two degree-one classes has negative Koszul sign. -/
example : (-1 : ℚ) ^ ((1 : ℕ) * 1) = -1 := by
  norm_num

/-- For scalar phi = 2 and gamma = 3, the supplied Herr d0 sends 1 to (1,2),
and d1(a,b) = 2a-b kills that vector. -/
example : (((2 : ℚ) - 1) * 1, ((3 : ℚ) - 1) * 1) = (1, 2) ∧
    ((3 : ℚ) - 1) * (((2 : ℚ) - 1) * 1) -
      ((2 : ℚ) - 1) * (((3 : ℚ) - 1) * 1) = 0 := by
  norm_num

/-- Swapping the degree-one coordinates changes d1 by minus one in Liu's
convention; the degree-two comparison must include that sign. -/
example : ((3 : ℚ) - 1) * 1 - ((2 : ℚ) - 1) * 0 = 2 ∧
    ((2 : ℚ) - 1) * 0 - ((3 : ℚ) - 1) * 1 = -2 := by
  norm_num

/-- With arithmetic Artin and character first, the supplied normalized cup value is +1;
the scalar Koszul coefficient for the reversed order is -1. -/
example : (!![(0 : ℚ), 1; -1, 0]) *ᵥ ![0, 1] = ![1, 0] ∧
    (!![(0 : ℚ), 1; -1, 0]) *ᵥ ![1, 0] = ![0, -1] := by
  sorry

/-! ## Layer 5: Monodromy and admissibility -/

/-!
README §5.1's zero-Lie-action assertion uses a finite extension F/Q_p, a finite
scalar action of Gamma_K, and a finite-dimensional continuous semilinear
F-representation. On an open subgroup fixing F the representation is linear;
zero Lie action and logarithm/exponential give an open kernel. Over K_infinity,
zero Sen action gives vectorwise open stabilizers. The natural action on
K_infinity has zero Sen operator and faithful scalar action.
-/

/-- The reduction of X squared plus one has no root at three;
monic reduction then excludes a root over the 3-adic field. -/
example : ∀ x : ZMod 3, x ^ 2 + 1 ≠ 0 := by
  decide

/-- With the corrected Berger logarithm at p=3, N(X) is minus three halves. -/
example : (- Polynomial.C (3/2 : ℚ) * Polynomial.derivative Polynomial.X) =
    Polynomial.C (-3/2 : ℚ) := by
  sorry

/-- A uniformizer of absolute valuation one half requires scaled monodromy. -/
example : - Polynomial.C (1/2 : ℚ) * Polynomial.derivative Polynomial.X =
    Polynomial.C (-1/2 : ℚ) := by
  sorry

/-- The nonadmissible rank-one input m = 1, h = 0 has invariant difference +1.
This is not an assertion of a period torsor for nonadmissible data. -/
example : (1 : ℤ) - 0 = 1 ∧ (0 : ℤ) - 1 = -1 := by
  norm_num

/-- The nonzero torsion coordinate of a PGL-two or quadratic norm-one torsor
survives in Z/2; the two difference signs agree here and cannot fix that sign. -/
example : (1 : ZMod 2) ≠ 0 ∧ 2 * (1 : ZMod 2) = 0 ∧
    (1 : ZMod 2) - 0 = 0 - 1 := by
  decide

/-- The sign action on the cocharacter lattice imposes the relation two. -/
example : (1 : ℤ) - (-1) = 2 := by
  norm_num

/-- A ramified quadratic descent sign changes the Frobenius polynomial from X minus one to X plus one. -/
example :
    (!![(-1 : ℚ)] : Matrix (Fin 1) (Fin 1) ℚ).charpoly = Polynomial.X + 1 ∧
    (!![(1 : ℚ)] : Matrix (Fin 1) (Fin 1) ℚ).charpoly = Polynomial.X - 1 := by
  sorry

/-! ## Layer 6: Ordinary lifting -/

/-- The mod-five tame factors cancel in the first residual character. -/
example : (2 : ZMod 5) * 3 = 1 ∧ (2 : ZMod 5) ≠ 1 := by
  decide

/-- The first character in the lifting counterexample still has nontrivial wild value. -/
example : (6 : ℚ) ≠ 1 ∧ (6 : ZMod 5) = 1 := by
  constructor
  · norm_num
  · decide

/-! ## Layer 7: Relative period cohomology -/

/-- The B-pair differential annihilates a diagonal section. -/
example : (LinearMap.fst ℚ ℚ ℚ - LinearMap.snd ℚ ℚ ℚ) (1, 1) = 0 := by
  sorry

/-- The Frobenius complex uses phi minus one. -/
example : ((2 : ℚ) - 1) * 1 = 1 ∧ ((1 : ℚ) - 2) * 1 = -1 := by
  norm_num

/-- The degree-zero positive-twist Koszul row is diagonal followed by difference. -/
example (x : ℚ) : (-1 : ℚ) * x + x = 0 := by
  ring

/-- In bidegree (1,1), the signed total differential has cancelling mixed terms. -/
example (a b : ℚ) : a * b + (-1 : ℚ) ^ (1 : ℕ) * (b * a) = 0 := by
  ring

/-- Omitting the total sign gives a nonzero mixed term in characteristic zero. -/
example : (1 : ℚ) * 1 + 1 * 1 = 2 ∧ (2 : ℚ) ≠ 0 := by
  norm_num

/-- At d = 1, positive analytic degree and geometric degree have opposite signs. -/
example : (1 : ℤ) - 0 = 1 ∧ -((1 : ℤ) - 0) = -1 ∧ -(-1 : ℤ) = 1 := by
  decide

/-! ## Layer 8: Rational geometric comparison -/

/-- For P3 = X squared + X + 3, dualizing gives roots of determinant one third;
arithmetic Weil Frobenius inverts again. These are coefficient computations. -/
example : (1/3 : ℚ)⁻¹ = 3 ∧ (-1/3 : ℚ) / (1/3) = -1 := by
  norm_num

/-- Over F_5 the ordinary example has three affine points and one point at infinity. -/
example :
    (Finset.univ.filter (fun P : ZMod 5 × ZMod 5 => P.2 ^ 2 = P.1 ^ 3 + P.1)).card = 3 ∧
    (Finset.univ.filter (fun P : ZMod 5 × ZMod 5 => P.2 ^ 2 = P.1 ^ 3 + P.1)).card + 1 = 4 := by
  decide

/-- Over F_3 the supersingular example has three affine points and one point at infinity. -/
example :
    (Finset.univ.filter (fun P : ZMod 3 × ZMod 3 => P.2 ^ 2 = P.1 ^ 3 - P.1)).card = 3 ∧
    (Finset.univ.filter (fun P : ZMod 3 × ZMod 3 => P.2 ^ 2 = P.1 ^ 3 - P.1)).card + 1 = 4 := by
  decide

/-- The good reduction of 11a1 at three has four affine points and one point at infinity. -/
example :
    (Finset.univ.filter (fun P : ZMod 3 × ZMod 3 =>
      P.2 ^ 2 + P.2 = P.1 ^ 3 - P.1 ^ 2 - 10 * P.1 - 20)).card = 4 ∧
    (Finset.univ.filter (fun P : ZMod 3 × ZMod 3 =>
      P.2 ^ 2 + P.2 = P.1 ^ 3 - P.1 ^ 2 - 10 * P.1 - 20)).card + 1 = 5 := by
  decide

/-! ## Layer 9: Kummer and Tate coordinates -/

/-- Coordinates of an extension action with character `a` and cocycle value `c`. -/
def kummerMatrix {R : Type*} [CommRing R] (a c : R) : Matrix (Fin 2) (Fin 2) R :=
  !![a, c; 0, 1]

/-- The cocycle equation is precisely this multiplication formula. -/
theorem kummerMatrix_mul {R : Type*} [CommRing R] (a c b d : R) :
    kummerMatrix a c * kummerMatrix b d = kummerMatrix (a * b) (c + a * d) := by
  sorry

/-- The determinant realizes the cyclotomic character when `a = χ_p(g)`. -/
theorem kummerMatrix_det {R : Type*} [CommRing R] (a c : R) :
    (kummerMatrix a c).det = a := by
  sorry

/-- Changing the cocycle by a coboundary is a unipotent change of basis. -/
theorem kummerMatrix_coboundary {R : Type*} [CommRing R] (a c b : R) :
    kummerMatrix 1 (-b) * kummerMatrix a c * kummerMatrix 1 b =
      kummerMatrix a (c + (a - 1) * b) := by
  sorry

/-- Test `kummerMatrix_identity`: the identity has zero cocycle. -/
example {R : Type*} [CommRing R] : kummerMatrix (1 : R) 0 = 1 := by
  sorry

/-- Test `kummerMatrix_split`: the zero cocycle is diagonal. -/
example {R : Type*} [CommRing R] (a : R) :
    kummerMatrix a 0 = !![a, 0; 0, 1] := by
  rfl

/-- Test `kummerMatrix_subline`: the character subline and trivial quotient. -/
example {R : Type*} [CommRing R] (a c : R) :
    kummerMatrix a c 0 0 = a ∧ kummerMatrix a c 1 0 = 0 ∧
      kummerMatrix a c 1 1 = 1 := by
  simp [kummerMatrix]

/-- Test `kummerMatrix_cocycle`: the character acts on the second cocycle term. -/
example : kummerMatrix (2 : ℚ) 3 * kummerMatrix 5 7 = kummerMatrix 10 17 := by
  sorry

/-- Test `kummerMatrix_rootChange`: the coboundary has the prescribed sign. -/
example : kummerMatrix (1 : ℚ) (-5) * kummerMatrix 2 3 * kummerMatrix 1 5 =
    kummerMatrix 2 8 := by
  sorry

/-- The coordinate formula for the normalized Tate L-invariant. -/
noncomputable def tateLInvariant {R : Type*} [Field R] (v ell : R) : R := ell / v

/-- The Frobenius matrix in the covariant Tate normal form. -/
noncomputable def tatePhiMatrix {R : Type*} [Field R] (r : R) :
    Matrix (Fin 2) (Fin 2) R := !![r⁻¹, 0; 0, 1]

/-- The monodromy matrix with `N(y) = v x`. -/
def tateMonodromyMatrix {R : Type*} [CommRing R] (v : R) :
    Matrix (Fin 2) (Fin 2) R := !![0, v; 0, 0]

/-- The generator `y + ell x` of the filtration line. -/
def tateFiltrationVector {R : Type*} [CommRing R] (ell : R) : Fin 2 → R := ![ell, 1]

/-- A common nonzero scaling preserves the invariant. -/
theorem tateLInvariant_scale {R : Type*} [Field R] (v ell c : R)
    (hv : v ≠ 0) (hc : c ≠ 0) :
    tateLInvariant (c * v) (c * ell) = tateLInvariant v ell := by
  sorry

/-- A changed logarithm branch shifts the invariant by its value on `p`. -/
theorem tateLInvariant_branch {R : Type*} [Field R] (v ell b : R) (hv : v ≠ 0) :
    tateLInvariant v (ell + b * v) = tateLInvariant v ell + b := by
  sorry

/-- Isomorphisms of the unframed normal forms are classified by the ratio. -/
theorem tateNormalForm_iso {R : Type*} [Field R] (v ell v' ell' : R)
    (hv : v ≠ 0) (hv' : v' ≠ 0) :
    (∃ a b : R, a ≠ 0 ∧ b ≠ 0 ∧ v * a = b * v' ∧ ell * a = b * ell') ↔
      tateLInvariant v ell = tateLInvariant v' ell' := by
  sorry

/-- The orientation of the period Frobenius–monodromy relation. -/
theorem tateMonodromy_frobenius {R : Type*} [Field R] (r v : R) (hr : r ≠ 0) :
    tateMonodromyMatrix v * tatePhiMatrix r =
      r • (tatePhiMatrix r * tateMonodromyMatrix v) := by
  sorry

/-- In the semistable Tate normal form, arithmetic Frobenius is inverse to period Frobenius. -/
theorem tateMonodromy_arithmeticFrobenius {R : Type*} [Field R] (r v : R)
    (hr : r ≠ 0) :
    !![r, 0; 0, 1] * tateMonodromyMatrix v =
      r • (tateMonodromyMatrix v * !![r, 0; 0, 1]) := by
  sorry

/-- Test `tateLInvariant_uniformizer`: zero logarithm gives zero invariant. -/
example {R : Type*} [Field R] : tateLInvariant (1 : R) 0 = 0 := by
  simp [tateLInvariant]

/-- Test `tateLInvariant_raw_log`: the invariant is unchanged by a Tate isogeny. -/
example : tateLInvariant (1 : ℚ) 2 = tateLInvariant 2 4 := by
  sorry

/-- Test `tateLInvariant_branch_test`: a branch shift adds its value on `p`. -/
example : tateLInvariant (2 : ℚ) (4 + 3 * 2) = tateLInvariant 2 4 + 3 := by
  sorry

/-- Test `tateFiltrationVector_second`: the line is transverse to `ker N`. -/
example {R : Type*} [CommRing R] (ell : R) :
    tateFiltrationVector ell 0 = ell ∧ tateFiltrationVector ell 1 = 1 := by
  simp [tateFiltrationVector]

/-- Test `tateMonodromy_square`: nilpotent does not mean zero. -/
example : tateMonodromyMatrix (1 : ℚ) * tateMonodromyMatrix 1 = 0 ∧
    tateMonodromyMatrix (1 : ℚ) ≠ 0 := by
  sorry

/-- Test `tatePhiMatrix_det`: covariant Frobenius has reciprocal determinant. -/
example {R : Type*} [Field R] (r : R) : (tatePhiMatrix r).det = r⁻¹ := by
  sorry

/-- Test `tateMonodromy_orientation`: the transposed operator fails the relation. -/
example : (!![(0 : ℚ), 0; 1, 0] * tatePhiMatrix (3 : ℚ)) ≠
    (3 : ℚ) • (tatePhiMatrix (3 : ℚ) * !![(0 : ℚ), 0; 1, 0]) := by
  sorry

/-- Zero logarithm gives the second basis vector. -/
example : tateFiltrationVector (0 : ℚ) = ![0, 1] := by
  sorry

/-- Opposite logarithms change the first coordinate and retain transversality. -/
example : tateFiltrationVector (2 : ℚ) ≠ tateFiltrationVector (-2 : ℚ) := by
  sorry

/-- Zero valuation gives zero monodromy. -/
example {R : Type*} [CommRing R] : tateMonodromyMatrix (0 : R) = 0 := by
  sorry

/-- Monodromy sends the second coordinate to the first. -/
example : tateMonodromyMatrix (2 : ℚ) *ᵥ ![3, 5] = ![10, 0] := by
  sorry

/-- For e = 2 and q = pi^5, N_K has coefficient 5 and absolute N has coefficient 5/2. -/
example : (1 / 2 : ℚ) • tateMonodromyMatrix (5 : ℚ) =
    tateMonodromyMatrix (5 / 2 : ℚ) := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [tateMonodromyMatrix]

/-- The prime two has reciprocal period Frobenius. -/
example : tatePhiMatrix (2 : ℚ) = !![1/2, 0; 0, 1] := by
  sorry

/-- A ramified quadratic inertia sign at p = 2 remains nontrivial over Q_2;
its mod-two reduction cannot detect that sign. These are scalar coordinates. -/
example : (-1 : ℚ) ≠ 1 ∧ (-1 : ZMod 2) = 1 := by
  constructor
  · norm_num
  · decide

/-- The unramified quadratic twist at p = 2 keeps reciprocal determinant. -/
example : (!![(-1/2 : ℚ), 0; 0, -1]).det = 1/2 := by
  norm_num [Matrix.det_fin_two]

/-- Twisting both Frobenius eigenvalues preserves the monodromy relation. -/
example : tateMonodromyMatrix (1 : ℚ) * !![-1/2, 0; 0, -1] =
    (2 : ℚ) • (!![-1/2, 0; 0, -1] * tateMonodromyMatrix (1 : ℚ)) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [tateMonodromyMatrix, Matrix.mul_apply, Fin.sum_univ_two]

/-- Arithmetic Frobenius inverts the two negative period eigenvalues. -/
example : (!![(-1/2 : ℚ), 0; 0, -1]) * !![-2, 0; 0, -1] = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [Matrix.mul_apply, Fin.sum_univ_two]

/-- Inverting period Frobenius gives arithmetic Frobenius in the semistable Tate normal form. -/
example : tatePhiMatrix (3 : ℚ) * !![3, 0; 0, 1] = 1 := by
  sorry


end TauCetiRoadmap.PadicHodgeTheory
