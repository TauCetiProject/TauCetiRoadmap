import Mathlib

/-!
# Arithmetic statistics, Part VIII: headline theorem statements

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`; these statements give Lean forms for selected milestones, and proving them
finishes neither a layer nor the roadmap.

Section 5.12 states the first moment, second-moment bound and variance estimate for local
densities of primitive homogeneous forms. The definitions use finite coefficient vectors
indexed by Mathlib's monomials, actual `MvPolynomial`s and primitive vectors over `ZMod`.
Section 5.17 states Vasiu's integral symplectic lifting criterion, including its exceptional
level-nine hypothesis. Section 5.18 states EVW's unique similitude-stable orbit theorem on
an arbitrary finite free `ℤ_ℓ`-module with a perfect alternating bilinear form.

The other arithmetic headlines need objects absent at the pins. The polarized concentration
and spacing/model obstructions of §§5.13–5.14 need principal polarizations, their finite
isomorphism-class counts and Frobenius polynomials; the model-ring comparison also needs
CM and quaternionic positive-unit orbit counts. The class-group/Hurwitz dictionary of §5.15
needs the arithmetic Hurwitz schemes. The geometric trace estimate of §5.16 needs rational
compactly supported étale cohomology and its Frobenius action. Hyperelliptic monodromy in
§5.17 needs the relative Jacobian, its torsion local systems and monodromy representations.
The rational-component and Cohen–Lenstra theorems of §§5.18–5.19 also need these Hurwitz
carriers and the cohomological uniform Betti hypothesis (HS). Wood's moments, bad-type
bounds and whole-component profiles in §§5.20–5.21 need marked Hurwitz schemes, reduced
Schur multipliers and the arithmetic extension counts. The Liu–Wood–Zureick-Brown and
Cohen–Lenstra–Martinet moments of §5.22 need the radical-discriminant extension families
and the maximal unramified extensions with their specified infinity conditions and group
actions. Their statements are deferred until those objects are available.
-/

noncomputable section
open scoped BigOperators

namespace TauCetiRoadmap.ArithmeticStatisticsPartVIII

namespace HypersurfaceDensity

/-- Primitive residue vectors, defined by their coordinates generating the unit ideal. -/
def primitiveVectors (ι : Type*) [Fintype ι] (q : ℕ) [NeZero q] :
    Finset (ι → ZMod q) := by
  classical
  exact Finset.univ.filter fun a => Ideal.span (Set.range a) = ⊤

/-- The homogeneous form with coefficients indexed by all degree-`d` monomials. -/
def coefficientForm (d n q : ℕ)
    (a : ↥(Finset.Nat.antidiagonalTuple (n + 1) d) → ZMod q) :
    MvPolynomial (Fin (n + 1)) (ZMod q) :=
  ∑ m, MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm m.val) (a m)

/-- Primitive zeros of the coefficient form modulo `q`, normalized by `qⁿ`. -/
def localDensity (d n q : ℕ) [NeZero q]
    (a : ↥(Finset.Nat.antidiagonalTuple (n + 1) d) → ZMod q) : ℝ := by
  classical
  exact (((primitiveVectors (Fin (n + 1)) q).filter fun b =>
    MvPolynomial.eval b (coefficientForm d n q a) = 0).card : ℝ) / (q : ℝ) ^ n

/-- §5.12, Browning–Le Boudec–Sawin Lemma 5.4: the exact first local-density moment. -/
theorem local_density_first_moment (d n p r : ℕ) [Fact p.Prime]
    (hd : 1 ≤ d) (hr : 1 ≤ r) :
    let N := (Finset.Nat.antidiagonalTuple (n + 1) d).card
    let R := primitiveVectors ↥(Finset.Nat.antidiagonalTuple (n + 1) d) (p ^ r)
    (∑ a ∈ R, localDensity d n (p ^ r) a) / R.card =
      (1 - ((p : ℝ) ^ (n + 1))⁻¹) * (1 - ((p : ℝ) ^ (N - 1))⁻¹) /
        (1 - ((p : ℝ) ^ N)⁻¹) := by
  sorry

/-- §5.12, Browning–Le Boudec–Sawin (5.15): a second-moment bound uniform in `r`. -/
theorem local_density_second_moment (d n p r : ℕ) [Fact p.Prime]
    (hd : 1 ≤ d) (hn : 2 ≤ n) (hr : 1 ≤ r) :
    let N := (Finset.Nat.antidiagonalTuple (n + 1) d).card
    let R := primitiveVectors ↥(Finset.Nat.antidiagonalTuple (n + 1) d) (p ^ r)
    (∑ a ∈ R, localDensity d n (p ^ r) a ^ 2) ≤
      (p : ℝ) ^ (r * N) *
        ((1 - ((p : ℝ) ^ (n + 1))⁻¹) ^ 2 + 2 / (p : ℝ) ^ (n - 1)) := by
  sorry

/-- §5.12, Browning–Le Boudec–Sawin Lemma 5.5: local densities concentrate about one,
with an explicit constant independent of the prime-power level. -/
theorem local_density_variance (d n p r : ℕ) [Fact p.Prime]
    (hd : 1 ≤ d) (hn : 2 ≤ n) (hr : 1 ≤ r) :
    let R := primitiveVectors ↥(Finset.Nat.antidiagonalTuple (n + 1) d) (p ^ r)
    (∑ a ∈ R, (localDensity d n (p ^ r) a - 1) ^ 2) / R.card ≤
      4 / (p : ℝ) ^ (n - 1) := by
  sorry

end HypersurfaceDensity

/-- §5.17, Vasiu Main Theorem 1.3: a closed symplectic subgroup with full reduction is
the whole group, with the additional level-nine kernel condition when `g = 1` and `ℓ = 3`. -/
theorem Similitude.integral_lift (ℓ g : ℕ) [Fact ℓ.Prime] (hℓ : 2 < ℓ) (hg : 1 ≤ g)
    (H : Subgroup (Matrix.symplecticGroup (Fin g) (PadicInt ℓ)))
    (hclosed : IsClosed (H : Set (Matrix.symplecticGroup (Fin g) (PadicInt ℓ))))
    (hred : ∀ M ∈ Matrix.symplecticGroup (Fin g) (ZMod ℓ),
      ∃ h : Matrix.symplecticGroup (Fin g) (PadicInt ℓ), h ∈ H ∧
        (h : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) (PadicInt ℓ)).map
          PadicInt.toZMod = M)
    (hsmall : g = 1 ∧ ℓ = 3 →
      ∃ h : Matrix.symplecticGroup (Fin g) (PadicInt ℓ), h ∈ H ∧
        (h : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) (PadicInt ℓ)).map
          PadicInt.toZMod = 1 ∧
        (h : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) (PadicInt ℓ)).map
          (PadicInt.toZModPow 2) ≠ 1) : H = ⊤ := by
  sorry

namespace Similitude

/-- Surjections fixed by an automorphism of multiplier `q` for the given bilinear form. -/
def similitudeFixedSurjections (ℓ : ℕ) [Fact ℓ.Prime]
    (V A : Type*) [AddCommGroup V] [Module (PadicInt ℓ) V]
    [AddCommGroup A] [Module (PadicInt ℓ) A]
    (B : LinearMap.BilinForm (PadicInt ℓ) V) (q : (PadicInt ℓ)ˣ) :
    Set (V →ₗ[PadicInt ℓ] A) :=
  {f | Function.Surjective f ∧ ∃ h : V ≃ₗ[PadicInt ℓ] V,
    (∀ x y, B (h x) (h y) = (q : PadicInt ℓ) * B x y) ∧ f.comp h.toLinearMap = f}

/-- §5.18, EVW Lemma 8.9: the surjections fixed by some multiplier-`q` similitude
form one nonempty symplectic orbit for every finite free perfectly alternating module. -/
theorem unique_similitude_stable_orbit (ℓ g : ℕ) [Fact ℓ.Prime] (hℓ : 2 < ℓ)
    (V A : Type*) [AddCommGroup V] [Module (PadicInt ℓ) V]
    [Module.Free (PadicInt ℓ) V] [Module.Finite (PadicInt ℓ) V]
    [AddCommGroup A] [Module (PadicInt ℓ) A] [Finite A]
    (B : LinearMap.BilinForm (PadicInt ℓ) V) (hB : B.IsAlt) [B.IsPerfPair]
    (hdim : Module.finrank (PadicInt ℓ) V = 2 * g)
    (q : (PadicInt ℓ)ˣ) (hq : IsUnit ((q : PadicInt ℓ) - 1))
    (hgen : ∃ f : (Fin g → PadicInt ℓ) →ₗ[PadicInt ℓ] A, Function.Surjective f) :
    (similitudeFixedSurjections ℓ V A B q).Nonempty ∧
      ∀ f ∈ similitudeFixedSurjections ℓ V A B q,
        ∀ f' ∈ similitudeFixedSurjections ℓ V A B q,
          ∃ e : B.IsometryEquiv B, f.comp e.toLinearEquiv.toLinearMap = f' := by
  sorry

end Similitude

end TauCetiRoadmap.ArithmeticStatisticsPartVIII
