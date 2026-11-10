import Mathlib
import TauCeti.Data.Nat.Prime.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Gram
import TauCeti.LinearAlgebra.IntegralLattice.Signature
import TauCeti.LinearAlgebra.IntegralLattice.Even
import TauCeti.LinearAlgebra.IntegralLattice.Unimodular
import TauCeti.LinearAlgebra.IntegralLattice.PosDef.EvenUnimodular
import TauCeti.NumberTheory.IntegralLattice.ClassNumber
import TauCeti.NumberTheory.IntegralLattice.Mass
import TauCeti.NumberTheory.IntegralLattice.LocalDensity.Basic

/-!
# Orthogonal Tamagawa comparison and lattice masses: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the class finiteness of indefinite lattices of rank at least three that follows from
Eichler's theorem (0.3), and the headline theorems of the positive-definite branch: the numerical
mass formula for an arbitrary positive definite integral lattice of rank at least three (1.3), its
rank-two form with the product over the primes taken in increasing order (1.3, through 1.4), the
even-unimodular mass formula (3.1) and the unconditional class counts in ranks 16, 24, 32 and 40.
They are stated on Tau Ceti's native integral lattices, with Tau Ceti's class set
`IntegralLattice.genusClasses`, mass `IntegralLattice.mass`, class number
`IntegralLattice.classNumber`, Gram matrix `IntegralLattice.gramMatrix`, determinant
`IntegralLattice.determinant` and local density `Matrix.localDensity`; the only definition made
here is the Bernoulli product of 3.1.

Not statable at the pins, and therefore not stated here:
* the structure theorems of 0.1 (Spin of an arbitrary nondegenerate form is a semisimple simply
  connected central μ₂-cover of SO for rank at least three): Tau Ceti has the form-preserving
  and standard special orthogonal group schemes, but no Spin group scheme attached to an arbitrary
  nondegenerate form;
* the measure identities of 1.2–1.3 (the gauge and Jacobian transport, and the identity of the
  full genus mass with `τ(SO)/(2 v_∞ ∏_p v_p)`): no Haar or Tamagawa measure is put on an adelic
  orthogonal group or its rational quotient. Section 1.1 transports the proper mass identity of
  GeometryOfNumbersAndQuadraticArithmetic §3.3.4 to native lattice classes and has no headline
  of its own. The numerical form of 1.3 is stated below as `genusMass_eq`;
* the quadratic residue-group comparison of 0.1a: the symmetric-bilinear equation schemes
  do not supply the quadratic-preserving scheme and its reduction in characteristic two;
* Cho's smooth dyadic model and density formula of 2.1–2.2: there is no smooth integral model
  attached to a Jordan splitting over an unramified extension of `ℤ₂`;
* the away-S Spin approximation of 0.3, over a number field `K` with a noncompactness hypothesis
  on every almost-`K`-simple factor: there is no algebraic Spin group of an arbitrary form over a
  number field with its almost-simple factors, and the native adelic Spin point groups are over
  `ℚ` only;
* Eichler's theorem in 0.3, the equality of proper classes and proper spinor genera for
  indefinite lattices of rank at least three: there is no proper spinor genus. Its class-finiteness
  consequence needs no spinor genus and is stated below as `finite_genusClasses_of_isIndefinite`.

The comparisons of 1.4 (from a binary lattice to its primitive quadratic order and signed
character, the ordered Euler product at `s = 1`, and the class-number, unit, regulator and
genus-index identities of that order) are steps of the proof of `genusMass_eq_rank_two` and
supporting identities of the indefinite binary branch, not headlines of their own.
-/

noncomputable section

open TauCeti

namespace TauCetiRoadmap.OrthogonalTamagawaAndLatticeMass

/-! ## Layer 0: native and scheme dictionaries -/

/-- Class finiteness for indefinite lattices, the application of Eichler's theorem in 0.3: the
genus of a nondegenerate indefinite integral lattice of rank at least three contains finitely many
isometry classes. By Eichler's theorem a proper spinor genus of such a lattice is a single proper
class, and a genus contains finitely many proper spinor genera (O'Meara, 104:5). -/
theorem finite_genusClasses_of_isIndefinite {V : Type*} [AddCommGroup V] [Module ℚ V]
    (L : IntegralLattice V) [L.IsNondegenerate] (hL : L.IsIndefinite)
    (hn : 3 ≤ Module.finrank ℤ L) : L.genusClasses.Finite := by
  sorry

/-! ## Layer 1: quotient and gauge transport -/

/-- Siegel's mass formula, the numerical form of 1.3: let `L` be a positive definite integral
lattice of rank `n ≥ 3`, with Gram matrix `G` in a `ℤ`-basis `b`. Then the full mass of the genus
of `L`, the sum of `1/|O(M)|` over its classes, is
`2 π^(−n(n+1)/4) ∏_{j=1}^{n} Γ(j/2) · (det L)^((n+1)/2) · ∏_p (α_p(G)/2)⁻¹`, where `α_p(G)` is the
local density of the image of `G` over `ℤ_p` and the product over all primes converges absolutely
(Conway–Sloane, equation (2), p.263, with the density `α_p` and the `p`-mass related in §12,
p.281). -/
theorem genusMass_eq {V : Type*} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V)
    (hL : L.IsPosDef) {n : ℕ} (hn : 3 ≤ n) (b : Module.Basis (Fin n) ℤ L) :
    (L.mass : ℝ) =
      2 * Real.pi ^ (-((n : ℝ) * (n + 1)) / 4) *
        (∏ j ∈ Finset.Icc 1 n, Real.Gamma ((j : ℝ) / 2)) *
        (L.determinant : ℝ) ^ (((n : ℝ) + 1) / 2) *
        ∏' p : Nat.Primes,
          ((((L.gramMatrix b).map (Int.castRingHom ℤ_[p])).localDensity : ℝ) / 2)⁻¹ := by
  sorry

/-- Siegel's mass formula in rank two, the binary case of 1.3 obtained through 1.4: let `L` be a
positive definite integral lattice of rank two, with Gram matrix `G` in a `ℤ`-basis `b`. Then the
partial products `(2/π) · (det L)^(3/2) · ∏_{p < N prime} (α_p(G)/2)⁻¹` tend to the full mass of
the genus of `L` as `N → ∞`. Here `2 π^(−3/2) Γ(1/2) Γ(1) = 2/π`; at the primes not dividing
`2 det L` the factor is `(1 − χ(p)/p)⁻¹` for the nontrivial quadratic character `χ` of `−det L`, so
the product converges conditionally, in this order, and not absolutely (Conway–Sloane,
equation (2), p.263, stated for `n ≥ 2`, with the density `α_p` and the `p`-mass related in §12,
p.281). -/
theorem genusMass_eq_rank_two {V : Type*} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V)
    (hL : L.IsPosDef) (b : Module.Basis (Fin 2) ℤ L) :
    Filter.Tendsto
      (fun N : ℕ => 2 / Real.pi * (L.determinant : ℝ) ^ ((3 : ℝ) / 2) *
        Finset.prod ((Finset.range N).subtype Nat.Prime) fun p : Nat.Primes =>
          ((((L.gramMatrix b).map (Int.castRingHom ℤ_[p])).localDensity : ℝ) / 2)⁻¹)
      Filter.atTop (nhds (L.mass : ℝ)) := by
  sorry

/-! ## Layer 3: even-unimodular specialization and exact arithmetic -/

/-- `|B_m/(2m)| · ∏_{j=1}^{m−1} |B_{2j}/(4j)|`, with Mathlib's Bernoulli numbers `bernoulli`
(`B₁ = −1/2`); at `m = 0` the division by zero makes it `0`. -/
def bernoulliFullMass (m : ℕ) : ℚ :=
  |bernoulli m / (2 * (m : ℚ))| *
    ∏ j ∈ Finset.Ico 1 m, |bernoulli (2 * j) / (4 * (j : ℚ))|

/-- The mass formula for even unimodular lattices: for a positive definite even unimodular
integral lattice `L` of positive rank `n` (so that `8 ∣ n`), the full mass of its genus, the sum
of `1/|O(M)|` over the classes of positive definite even unimodular lattices `M` of rank `n`, is
`|B_{n/2}/n| · ∏_{j=1}^{n/2−1} |B_{2j}/(4j)|` (Conway–Sloane, §9(iv), p.274). Belolipetsky–Gan,
Theorem 3.1, p.4, with the dyadic correction `λ₂ = 1` of §5, Corollary 5.3, p.7, gives twice this
value: their mass sums `1/|SO(M)|` over the proper classes, which is twice the full mass in
positive rank. -/
theorem evenUnimodularMass_eq {V : Type*} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V)
    (hL : L.IsPosDef) (hLe : L.IsEven) (hLu : L.IsUnimodular)
    (hn : 0 < Module.finrank ℤ L) :
    L.mass = bernoulliFullMass (Module.finrank ℤ L / 2) := by
  sorry

/-! ## Layer 4: automorphism orders and class counts -/

/-- There are exactly two isometry classes of positive definite even unimodular integral lattices
of rank 16: the genus of `E₈ ⊕ E₈`, which contains every such lattice, has class number two. -/
theorem rank16_classNumber : (IntegralLattice.e8PowLattice 2).classNumber = 2 := by
  sorry

/-- There are exactly twenty-four isometry classes of positive definite even unimodular integral
lattices of rank 24: the genus of `E₈³`, which contains every such lattice, has class number
twenty-four. -/
theorem rank24_classNumber : (IntegralLattice.e8PowLattice 3).classNumber = 24 := by
  sorry

/-- The number of isometry classes of positive definite even unimodular integral lattices of
rank 32, the class number of the genus of `E₈⁴`, exceeds ten million. -/
theorem rank32_classNumber_lower_bound :
    10 ^ 7 < (IntegralLattice.e8PowLattice 4).classNumber := by
  sorry

/-- The number of isometry classes of positive definite even unimodular integral lattices of
rank 40, the class number of the genus of `E₈⁵`, exceeds ten to the fifty-first power. -/
theorem rank40_classNumber_lower_bound :
    10 ^ 51 < (IntegralLattice.e8PowLattice 5).classNumber := by
  sorry

end TauCetiRoadmap.OrthogonalTamagawaAndLatticeMass
