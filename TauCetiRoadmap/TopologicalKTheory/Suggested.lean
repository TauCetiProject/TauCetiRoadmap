module

public import Mathlib
public import TauCeti.RingTheory.PowerSeries.Log

/-!
# Topological K-theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, the roadmap's headline theorems that are statable now, each with
`sorry` as a mathematical target, together with the few definitions they need.

One headline theorem is statable at the pins and is stated: real Bott periodicity in the
homotopy of the orthogonal groups (T7.1), `π_k(O) ≅ KO^(−k−1)(pt)`, read on the finite
groups `Matrix.orthogonalGroup (Fin n) ℝ` in the stable range `n ≥ k + 2`
(`nonempty_homotopyGroup_orthogonalGroup_mulEquiv`).

The other headline theorems are not statable at the pins, and nothing is stated in their
place:

* complex Bott periodicity `K(X) ⊕ K(X) ≃ K(X × S²)` and the sphere ring
  `K(S²) ≃ ℤ[β]/(β²)` (T4): the pinned Tau Ceti has the constant-rank bundle category
  `TauCeti.FiniteRankBundleCore ℂ X` with its Whitney biproducts, so `TauCeti.SplitK0` of
  it is a group, and the tautological line on `TauCeti.finiteGrassmannian ℂ 1 2 ≅ ℂP¹` is
  an object of it by `TauCeti.FiniteRankBundleCore.ofBundle`; but the category has no
  tensor product and no external product of bundles, so neither `β² = 0` nor the
  periodicity map can be stated, and there is no variable-rank bundle category;
* the complex Thom isomorphism (T5.3): no K-group of a locally compact space with compact
  supports and no Koszul Thom class of a vector bundle in K-theory;
* the equivariant Thom isomorphism and the representation Bott theorem
  `R(G) ≃ K_(G,c)(V)` (T6): no equivariant K-group of a `G`-space;
* real Bott periodicity in K-theory, `KO^n(X,Y) ≃ KO^(n−8)(X,Y)` as the product with the
  degree −8 class `b`, and the coefficient ring `ℤ[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)` (T7.1): no
  relative or negative-degree KO-group of a space and no product of real bundles;
* the (1,1)-periodicity of Real K-theory (T7.1): no KR-group of a space with involution;
* the eightfold stable Bott equivalence `ℤ × BO → Ω⁸(ℤ × BO)` (T7.1): no stable
  Grassmannian `BO`.

Also stated: the integral λ-series Adams values (T2.5) and the spectral projection of a
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

/-! ## T7.1: real Bott periodicity in the homotopy of the orthogonal groups -/

/-- Real Bott periodicity for the orthogonal groups in the stable range: for `k = i + 1 ≥ 1`
and `n ≥ k + 2`, the homotopy group `π_k(O(n))` at the identity is `ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ`
according as `k ≡ 0, 1, …, 7 (mod 8)`, read off the table with `ZMod 0 = ℤ` and `ZMod 1`
trivial. This is T7.1's `π_k(O) ≅ KO^(−k−1)(pt)` on the finite stages, through the stable
range of the block inclusions (Hatcher, *Vector Bundles and K-Theory*, Introduction, p. 1,
for the table of reduced KO of spheres, and §4.1, p. 108, for the stable range). -/
theorem nonempty_homotopyGroup_orthogonalGroup_mulEquiv (i n : ℕ) (hn : i + 3 ≤ n) :
    Nonempty (HomotopyGroup.Pi (i + 1) (Matrix.orthogonalGroup (Fin n) ℝ) 1 ≃*
      Multiplicative (ZMod (![2, 2, 1, 0, 1, 1, 1, 0]
        ⟨(i + 1) % 8, Nat.mod_lt _ (by norm_num)⟩))) := by
  sorry

end TauCetiRoadmap.TopologicalKTheory
