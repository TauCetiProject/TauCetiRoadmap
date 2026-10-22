import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.SelmerGroup
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic

/-!
# Arithmetic statistics, Part VII: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`, including source locators, supplier contracts and the full basic theory.

Layer 5 statements here are the finite quadratic intersection generating function (§5.4),
its total-variation Poonen–Rains limit and cardinality moments, and Delaunay compatibility
(§5.5); the total-variation alternating-kernel limit (§5.6); BKLPR prime-power injection
moments (§5.7); and parity-sensitive moment recovery and Kane's full rational two-torsion
twist distribution (§5.9). The arithmetic statement uses Tau Ceti's actual two-Selmer group
at all finite places and the real place, with the signed and positive integer denominators.

The other headline results need constructions beyond these signatures. The Cohen–Lenstra
and Cohen–Martinet arithmetic implications (§§5.1–5.3) need the discriminant-ordered field
families and finite-group class laws. The all-rank alternating-cokernel and p-adic isotropic
limits (§§5.6–5.7), integral orthogonal geometry and Oesterlé measures (§5.29), and all-prime
Delaunay comparisons (§5.30) need the symplectic class laws and intrinsic rank-stratum
measures. The locally compact probability theorem (§5.26) needs finite quadratic reduction
maps and their inverse-limit topology on maximal isotropics; these are not pinned APIs.

General Selmer groups, Sha and p-infinity Selmer coranks are absent at the pins, although
elliptic two-descent is available. Thus the Selmer conjecture implications (§5.8), corank
and three-isogeny/CM twist applications (§§5.9–5.11, 5.32), global theta-quadratic intersection
(§5.27), Jacobian and composite Selmer conjectures (§5.28), and local/adelic Kummer summand
comparisons (§5.31) have no signatures here. The function-field three-Selmer bound (§5.9)
also needs its geometric-height elliptic-surface family. CM reciprocity and the Hecke-character
comparison need CM uniformizations and the CM ideal action. These results are specified in
the README; no substitute structures or hypotheses represent their missing objects here.
-/

noncomputable section
open scoped BigOperators Topology Classical
open Polynomial Filter

namespace TauCetiRoadmap.ArithmeticStatisticsPartVII
namespace Distributions

/-- The quadratic-isotropic, polar-self-orthogonal subspaces of §5.4. -/
def IsMaxIsotropic {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (Q : QuadraticForm K V) (W : Submodule K V) : Prop :=
  (∀ v ∈ W, Q v = 0) ∧ LinearMap.BilinForm.orthogonal Q.polarBilin W = W

/-- The parameter set of maximal quadratic-isotropic subspaces in §5.4. -/
def maxIsotropicSubspaces {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (Q : QuadraticForm K V) : Set (Submodule K V) :=
  {W | IsMaxIsotropic Q W}

/-- Weak metabolicity in §5.4 combines polar nondegeneracy with a maximal isotropic. -/
def IsWeaklyMetabolic {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (Q : QuadraticForm K V) : Prop :=
  Q.polarBilin.Nondegenerate ∧ (maxIsotropicSubspaces Q).Nonempty

/-- The intersection dimension generating function of §5.4 counts actual isotropic subspaces. -/
theorem maxIsotropic_intersection_generating_function {K V : Type*}
    [Field K] [Fintype K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (Q : QuadraticForm K V) (hQ : IsWeaklyMetabolic Q) (n : ℕ)
    (hdim : Module.finrank K V = 2 * n) (W : Submodule K V)
    (hW : IsMaxIsotropic Q W) (z : ℝ) :
    (∑' Z : {Z : Submodule K V // Z ∈ maxIsotropicSubspaces Q},
      z ^ Module.finrank K ↥(Z.val ⊓ W)) =
      ∏ i ∈ Finset.range n, (z + (Fintype.card K : ℝ) ^ i) := by sorry

/-- The normalizing infinite product in the Poonen–Rains distribution (§5.5). -/
def poonenRainsConstant (p : ℕ) : ℝ :=
  ∏' i : ℕ, (1 + (p : ℝ) ^ (-(i : ℤ)))⁻¹

/-- The dimension weights of the Poonen–Rains distribution (§5.5). -/
def poonenRainsWeight (p d : ℕ) : ℝ :=
  poonenRainsConstant p * ∏ i ∈ Finset.range d, (p : ℝ) / ((p : ℝ) ^ (i + 1) - 1)

/-- The actual finite quadratic intersection probability of §§5.4–5.5. -/
def intersectionWeight {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (Q : QuadraticForm K V) (W : Submodule K V) (d : ℕ) : ℝ :=
  (Nat.card {Z : {Z : Submodule K V // Z ∈ maxIsotropicSubspaces Q} //
    Module.finrank K ↥(Z.val ⊓ W) = d} : ℝ) /
      Nat.card {Z : Submodule K V // Z ∈ maxIsotropicSubspaces Q}

/-- The finite quadratic intersection laws converge in total variation (§5.5). -/
theorem intersectionLaw_tendsto_poonenRains (p : ℕ) [Fact p.Prime]
    (V : ℕ → Type*) [(n : ℕ) → AddCommGroup (V n)]
    [(n : ℕ) → Module (ZMod p) (V n)] [(n : ℕ) → FiniteDimensional (ZMod p) (V n)]
    (Q : (n : ℕ) → QuadraticForm (ZMod p) (V n))
    (W : (n : ℕ) → Submodule (ZMod p) (V n))
    (hQ : ∀ n, IsWeaklyMetabolic (Q n))
    (hdim : ∀ n, Module.finrank (ZMod p) (V n) = 2 * n)
    (hW : ∀ n, IsMaxIsotropic (Q n) (W n)) :
    HasSum (poonenRainsWeight p) 1 ∧
      Tendsto (fun n => ∑' d, |intersectionWeight (Q n) (W n) d - poonenRainsWeight p d|)
        atTop (𝓝 0) := by sorry

/-- Poonen–Rains moments (§5.5) give every cardinality moment with its summability. -/
theorem poonenRainsWeight_moments (p : ℕ) (hp : p.Prime) (m : ℕ) :
    Summable (fun d => poonenRainsWeight p d * (p : ℝ) ^ (m * d)) ∧
      (∑' d, poonenRainsWeight p d * (p : ℝ) ^ (m * d)) =
        ∏ i ∈ Finset.range m, ((p : ℝ) ^ (i + 1) + 1) := by sorry

/-- The corrected Delaunay law of §5.5 assigns this weight to Sha dimension `2n`. -/
def delaunayWeight (p r n : ℕ) : ℝ :=
  (p : ℝ) ^ (-((n * (2 * r + 2 * n - 1) : ℕ) : ℤ)) *
    (∏' i : ℕ, (1 - (p : ℝ) ^ (-(2 * ((r + n + i : ℕ) : ℤ) + 1)))) /
    ∏ i ∈ Finset.range n, (1 - (p : ℝ) ^ (-(2 * ((i + 1 : ℕ) : ℤ))))

/-- Delaunay compatibility of the Selmer model (§5.5) uniquely recovers the half-rank prior. -/
theorem delaunay_compatibility (p : ℕ) (hp : p.Prime) (ν : ℕ → ℝ)
    (hν : ∀ r, 0 ≤ ν r) (hsum : HasSum ν 1) :
    (∀ d, (∑ r ∈ Finset.range (d + 1),
      if (d - r) % 2 = 0 then ν r * delaunayWeight p r ((d - r) / 2) else 0) =
        poonenRainsWeight p d) ↔
      ∀ r, ν r = if r ≤ 1 then 1 / 2 else 0 := by sorry

/-- The rational finite alternating-kernel law of §5.6 retains zero diagonal at two. -/
def alternatingKernelLaw (p j n : ℕ) [Fact p.Prime] : ℚ :=
  (Nat.card {A : Matrix (Fin n) (Fin n) (ZMod p) //
    (∀ i, A i i = 0) ∧ A.transpose = -A ∧
      Module.finrank (ZMod p) (LinearMap.ker (Matrix.toLin' A)) = j} : ℚ) /
    (p : ℚ) ^ (n * (n - 1) / 2)

/-- Parity-averaged alternating kernel laws converge in total variation (§5.6). -/
theorem alternatingKernelLimit_eq_poonenRains (p : ℕ) [Fact p.Prime] :
    Tendsto (fun n => ∑' j, |((alternatingKernelLaw p j (2 * n) : ℝ) +
      (alternatingKernelLaw p j (2 * n + 1) : ℝ)) / 2 - poonenRainsWeight p j|)
        atTop (𝓝 0) := by sorry

/-- Uniform cardinality moments and parity recover every reduced dimension frequency. -/
theorem parity_sensitive_twist_moment_determinacy (ν : ℕ → ℕ → ℝ)
    (hnonneg : ∀ N r, 0 ≤ ν N r)
    (hprob : ∀ N, ∑' r, ν N r = 1)
    (hsum : ∀ N k : ℕ, Summable (fun r => ν N r * (2 : ℝ) ^ (k * r)))
    (hbound : ∀ k : ℕ, ∃ R : ℝ, ∀ N,
      ∑' r, ν N r * (2 : ℝ) ^ (k * r) ≤ R)
    (hmom : ∀ k : ℕ, Tendsto (fun N => ∑' r, ν N r * (2 : ℝ) ^ (k * r))
      atTop (𝓝 (∏ i ∈ Finset.range k, ((2 : ℝ) ^ (i + 1) + 1))))
    (hparity : Tendsto (fun N => ∑' r, (-1 : ℝ) ^ r * ν N r) atTop (𝓝 0)) :
    ∀ r, Tendsto (fun N => ν N r) atTop (𝓝 (poonenRainsWeight 2 r)) := by sorry

/-- Maximal quadratic-isotropic direct summands of the split prime-power module (§5.7). -/
def hyperbolicSummands (p e n : ℕ) :
    Set (Submodule (ZMod (p ^ e))
      ((Fin n → ZMod (p ^ e)) × (Fin n → ZMod (p ^ e)))) :=
  {Z | Nonempty (Z ≃ₗ[ZMod (p ^ e)] (Fin n → ZMod (p ^ e))) ∧
    (∃ T, IsCompl Z T) ∧ ∀ v ∈ Z, ∑ i, v.1 i * v.2 i = 0}

/-- The injection moment of two independent uniform quadratic-isotropic summands (§5.7). -/
def isotropicInjectionAverage (p e m n : ℕ) : ℝ :=
  (∑' Z : hyperbolicSummands p e n, ∑' W : hyperbolicSummands p e n,
    (Nat.card {f : (Fin m → ZMod (p ^ e)) →+ ↥(Z.val ⊓ W.val) //
      Function.Injective f} : ℝ)) / (Nat.card (hyperbolicSummands p e n) : ℝ) ^ 2

/-- BKLPR's prime-power injection moments converge to the model prediction (§5.7). -/
theorem bklpr_injection_moments (p : ℕ) [Fact p.Prime] (e : ℕ) (he : 0 < e) (m : ℕ) :
    Tendsto (fun n => isotropicInjectionAverage p e m n) atTop
      (𝓝 ((p : ℝ) ^ (e * (m * (m + 1) / 2)))) := by sorry

end Distributions

/-- The two-Selmer cardinality of the twist by a nonzero integer, using the native descent
carrier with every finite place and the real place of ℚ (§5.9). -/
def twistTwoSelmerCard (W : WeierstrassCurve ℚ) [W.IsElliptic] [W.IsCharNeTwoNF]
    (b : {b : ℤ // b ≠ 0}) : ℕ := by
  let E := W.quadraticTwistOf 0 (-(b.val : ℚ))
  haveI : E.IsElliptic := W.isElliptic_quadraticTwistOf 0 (-(b.val : ℚ)) (by
    simpa using (mul_ne_zero (by norm_num : (4 : ℚ) ≠ 0) (Int.cast_ne_zero.mpr b.property)))
  haveI : E.IsCharNeTwoNF := by
    constructor <;> simp_all [E, WeierstrassCurve.quadraticTwistOf]
  exact Nat.card (E.toAffine.selmerGroup₂ ℤ (fun _ : Unit => ℝ))

/-- Kane's full rational two-torsion twist distribution, with signed and positive orderings (§5.9).
The cubic and nonsquare hypotheses exclude rational cyclic four-isogenies. -/
theorem two_selmer_twist_distribution (W : WeierstrassCurve ℚ)
    [W.IsElliptic] [W.IsCharNeTwoNF] (c : Fin 3 → ℚ) (hc : Function.Injective c)
    (hf : W.toAffine.f = ∏ i, (X - C (c i)))
    (hfour : ∀ i j k : Fin 3, i ≠ j → i ≠ k → j ≠ k →
      ¬IsSquare ((c i - c j) * (c i - c k))) (d : ℕ) :
    Tendsto (fun N : ℕ =>
      (Nat.card {b : {b : ℤ // b ≠ 0} // b.val.natAbs ≤ N ∧
        twistTwoSelmerCard W b = 2 ^ (d + 2)} : ℝ) / (2 * (N : ℝ)))
      atTop (𝓝 (Distributions.poonenRainsWeight 2 d)) ∧
    Tendsto (fun N : ℕ =>
      (Nat.card {b : {b : ℤ // b ≠ 0} // 0 < b.val ∧ b.val.natAbs ≤ N ∧
        twistTwoSelmerCard W b = 2 ^ (d + 2)} : ℝ) / (N : ℝ))
      atTop (𝓝 (Distributions.poonenRainsWeight 2 d)) := by sorry

end TauCetiRoadmap.ArithmeticStatisticsPartVII
