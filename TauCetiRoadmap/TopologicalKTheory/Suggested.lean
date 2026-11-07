module

public import Mathlib
public import TauCeti.RingTheory.PowerSeries.Log

/-!
# Topological K-theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, those targets of the roadmap that are statable now, each with
`sorry` as a mathematical target, together with the few definitions they need.

The roadmap's headline theorems are not statable at the pins, and nothing is stated in
their place:

* complex Bott periodicity `K(X) ⊕ K(X) ≃ K(X × S²)` and the sphere ring
  `K(S²) ≃ ℤ[β]/(β²)` (T4): the pinned Tau Ceti has the constant-rank bundle category
  `TauCeti.FiniteRankBundleCore ℂ X` with its Whitney biproducts, so
  `TauCeti.SplitK0` of it is a group, but it has no tensor product of bundles, no external
  product and no tautological line bundle on `S²` as an object of that category, and no
  variable-rank bundle category; the periodicity map and the ring structure are therefore
  not statable;
* the complex Thom isomorphism (T5.3): no K-group of a locally compact space with compact
  supports and no Koszul Thom class of a vector bundle in K-theory;
* the equivariant Thom isomorphism and the representation Bott theorem
  `R(G) ≃ K_(G,c)(V)` (T6): no equivariant K-group of a `G`-space;
* real Bott periodicity with coefficient ring `ℤ[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)` (T7.1):
  no KO-group of a space.

What is stated: the integral λ-series Adams values (T2.5) and the spectral projection of a
continuous finite matrix family (T4.4). The finite Grassmannian carriers, the finite trivial
embedding and complement, the gap partition of unity, the finite oriented carriers and the
principal-bundle class that T1.3, T1.5, T1.6a and T6.4 consume are Tau Ceti declarations at
the pin, cited by name in the README and not restated here.
-/

@[expose] public section

noncomputable section
open Topology
open scoped Matrix.Norms.Operator
namespace TauCetiRoadmap.TopologicalKTheory

/-! ## T2.5: integral Adams values of a λ-series -/

/-- The integral logarithmic-derivative coefficient of a unit λ-series: index `n` gives
`ψ^(n+1)` through `Σ_(k≥1) (−1)^(k−1) ψᵏ t^(k−1) = λ'_t · λ_t⁻¹`; no rational logarithm
or division is involved. -/
def adamsValueOfLambdaSeries {R : Type*} [CommRing R]
    (lambdaSeries : (PowerSeries R)ˣ) (n : ℕ) : R :=
  (-1 : R) ^ n * PowerSeries.coeff n
    (PowerSeries.derivative (lambdaSeries : PowerSeries R) *
      (↑(lambdaSeries⁻¹) : PowerSeries R))

/-- The signed derivative coefficient is additive on products of unit series, which is
the additivity of the Adams operations under the exterior-power sum law. T2.5 compares
it with the integral Newton definition. -/
theorem adamsValueOfLambdaSeries_mul {R : Type*} [CommRing R]
    (a b : (PowerSeries R)ˣ) (n : ℕ) :
    adamsValueOfLambdaSeries (a * b) n =
      adamsValueOfLambdaSeries a n + adamsValueOfLambdaSeries b n := by
  have hd : PowerSeries.derivative ((a : PowerSeries R) * (b : PowerSeries R)) *
      (((↑(b⁻¹) : PowerSeries R) : PowerSeries R) * (↑(a⁻¹) : PowerSeries R)) =
      PowerSeries.derivative (a : PowerSeries R) * (↑(a⁻¹) : PowerSeries R) +
        PowerSeries.derivative (b : PowerSeries R) * (↑(b⁻¹) : PowerSeries R) := by
    simp only [Derivation.leibniz, smul_eq_mul]
    calc
      _ = (PowerSeries.derivative (a : PowerSeries R) * (↑(a⁻¹) : PowerSeries R)) *
          ((b : PowerSeries R) * (↑(b⁻¹) : PowerSeries R)) +
        (PowerSeries.derivative (b : PowerSeries R) * (↑(b⁻¹) : PowerSeries R)) *
          ((a : PowerSeries R) * (↑(a⁻¹) : PowerSeries R)) := by ring
      _ = _ := by simp
  unfold adamsValueOfLambdaSeries
  simp only [mul_inv_rev, Units.val_mul]
  rw [hd, map_add, mul_add]

/-- On a `ℚ`-algebra the integral unit-derivative expression agrees with Tau Ceti's
rational logarithmic derivative `PowerSeries.logDeriv` of a constant-coefficient-one
series. -/
theorem adamsValueOfLambdaSeries_eq_coeff_logDeriv
    {A : Type*} [CommRing A] [Algebra ℚ A]
    (a : (PowerSeries A)ˣ) (ha : PowerSeries.constantCoeff (a : PowerSeries A) = 1)
    (n : ℕ) :
    adamsValueOfLambdaSeries a n =
      (-1 : A) ^ n * PowerSeries.coeff n (PowerSeries.logDeriv (a : PowerSeries A)) := by
  unfold adamsValueOfLambdaSeries
  have hd := PowerSeries.logDeriv_mul (a : PowerSeries A) ha
  have h := congrArg (fun f : PowerSeries A => f * ↑(a⁻¹)) hd
  simpa [mul_assoc] using congrArg
    (fun f : PowerSeries A => (-1 : A) ^ n * PowerSeries.coeff n f) h.symm

/-! ## T4.4: spectral splitting of a finite matrix family -/

section SpectralSplitting
variable {X : Type*} [TopologicalSpace X] [CompactSpace X] {n : ℕ}

/-- The spectral projection of a continuous family of finite matrices with no eigenvalue
on the unit circle: a continuous idempotent family commuting with `B`, equal to the
identity on the generalized eigenvectors of eigenvalues inside the circle and to zero on
those outside. The matrices are not assumed self-adjoint; the generalized-eigenvector
condition fixes which spectral subspace is selected, in addition to idempotence. -/
theorem exists_continuous_inside_projection (B : C(X, Matrix (Fin n) (Fin n) ℂ))
    (hcircle : ∀ (x : X) (z : ℂ), ‖z‖ = 1 → IsUnit (z • (1 : Matrix (Fin n) (Fin n) ℂ) - B x)) :
    ∃ P : C(X, Matrix (Fin n) (Fin n) ℂ),
      (∀ x, P x * P x = P x) ∧
      (∀ x, P x * B x = B x * P x) ∧
      ∀ (x : X) (z : ℂ) (k : ℕ) (v : Fin n → ℂ),
        Matrix.mulVec ((B x - z • (1 : Matrix (Fin n) (Fin n) ℂ)) ^ k) v = 0 →
          Matrix.mulVec (P x) v = if ‖z‖ < 1 then v else 0 := by
  sorry
end SpectralSplitting

end TauCetiRoadmap.TopologicalKTheory
