import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.FinitelyGenerated
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.Regulator

/-!
# Effective Diophantine methods: headline theorems

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; proving these statements alone does not finish a layer or the roadmap.

The statements below give the exact Matveev and Yu bounds of §§2.3 and 2.5,
Cremona's rational and Silverman's number-field height estimates of §3.12,
the full Mordell–Weil basis criterion of §3.22, and the quantitative matching of
geometric roots with multiplicities of §6.16. The latter is stated after the
normalization G(T) = p⁻ᵏ F(pT), over any complete algebraically closed normed
extension of Q_p, with analytic orders as multiplicities. The scalar constants,
generated subgroup and series evaluation have explicit definitions on native carriers.

The exact-list implications of §§2.20, 2.28 and 2.33 are deferred here: their
ThueData, ThueMahlerData and SUnitData require the complete arithmetic covering,
root/logarithm enclosure and reduction-validity constructions of Layer 2.
Their finiteness consequences alone do not state those implications.

The Chabauty finiteness and good/bad-reduction bounds of §§4.12–4.14, the exact
Chabauty–Coleman lists of §4.18 and §§4.23–4.25, the number-field and symmetric
criteria of §§4.19–4.22, and the geometric sieve conclusions of §§5.22–5.29 need
the curve's actual Jacobian, Abel–Jacobi map, abelian logarithm, relative model
and reduction comparisons. The pins have abelian varieties but not these constructions.
The quadratic Chabauty completeness and Hodge/Frobenius/local-height theorems of
§§6.4, 6.8 and 6.11–6.14 additionally need the universal unipotent connection,
its filtered Frobenius quotient A_Z and the geometric height pairing.

The conditional arithmetic applications of §§3.24–3.29 and §§6.18–6.39 also
require their identified arithmetic/model inputs. In particular, the Cartan,
exceptional and prime-level modular curves, their Jacobians, modular j-maps and
CM comparisons used in §§6.29–6.35 are absent at the pins. The equations and
finite coordinate lists of §§6.36–6.39 are expressible, but their full arithmetic
input and validity types are not supplied by the pins or a few scalar definitions.
No unlabelled solution-set assertion replaces a conditional application.
-/

noncomputable section
open scoped BigOperators
namespace TauCetiRoadmap.EffectiveDiophantineMethods

namespace ED2

/-- Rational upper constant dominating both real and complex Matveev constants (§2.2). -/
def matveevConstantUpper (n D : ℕ) (A : Fin n → ℚ) (s L : ℚ) : ℚ :=
  let e : ℚ := 27182818286 / 10 ^ 10
  max (min (e * n / 2 * 30 ^ (n + 3) * (n : ℚ) ^ 3 * s) (2 ^ (6 * n + 20)))
      (min ((e * n / 2) ^ 2 / 2 * 30 ^ (n + 3) * (n : ℚ) ^ 3 * s)
        (2 ^ (6 * n + 20))) * D ^ 2 * (1 + L) * ∏ i, A i

/-- The exact lower bound for a nonzero algebraic logarithmic form (§2.3). -/
theorem matveev_lower_bound {K : Type*} [Field K] [NumberField K]
    (σ : K →+* ℂ) (n D : ℕ) (hn : 0 < n) (hD : 0 < D)
    (hdegree : Module.finrank ℚ K ≤ D) (α : Fin n → Kˣ) (logs : Fin n → ℂ)
    (hlogs : ∀ i, logs i ≠ 0 ∧ Complex.exp (logs i) = σ (α i))
    (A : Fin n → ℚ) (s L c : ℚ) (hs : 0 ≤ s) (hsq : (n : ℚ) ≤ s ^ 2)
    (hL : Real.log D ≤ (L : ℝ)) (hA : ∀ i, (16 / 100 : ℚ) ≤ A i)
    (hheight : ∀ i, (D : ℝ) * NumberField.absLogHeight₁ (α i : K) ≤ (A i : ℝ))
    (hnorm : ∀ i, ‖logs i‖ ≤ (A i : ℝ))
    (hc : matveevConstantUpper n D A s L ≤ c)
    (b : Fin n → ℤ) (hne : ∑ i, b i • logs i ≠ 0) :
    -(c : ℝ) * (1 + Real.log ((Finset.univ.sup (fun i => (b i).natAbs) : ℕ) : ℝ)) <
      Real.log ‖∑ i, b i • logs i‖ := by
  sorry

/-- Rational upper constant for Yu's normalized valuation bound (§2.4). -/
def yuConstantUpper (n d p : ℕ) (h : Fin n → ℚ) (logLower logUpper : ℚ) : ℚ :=
  22000 * ((19 / 2 : ℚ) * (n + 1) * d) ^ (2 * (n + 1)) /
    logLower ^ (n + 1) * ((p : ℚ) ^ d - 1) * (∏ i, h i) * logUpper

/-- Yu's bound in an arbitrary finite p-adic extension, with ord_p(p) = 1 (§2.5). -/
theorem yu_valuation_upper_bound {K : Type*} [Field K] [NumberField K]
    {p : ℕ} [Fact p.Prime] {L : Type*} [NormedField L] [CompleteSpace L]
    [NormedAlgebra ℚ_[p] L] [FiniteDimensional ℚ_[p] L]
    (σ : K →+* ℂ) (ι : K →+* L) (n d : ℕ) (hn : 2 ≤ n) (hd : 0 < d)
    (hdegree : Module.finrank ℚ K ≤ d) (α : Fin n → Kˣ)
    (h : Fin n → ℚ) (logLower logUpper Φ : ℚ)
    (hpos : 0 < logLower) (hlog : (logLower : ℝ) ≤ Real.log p)
    (hheight : ∀ i, NumberField.absLogHeight₁ (α i : K) ≤ (h i : ℝ))
    (hnorm : ∀ i, ‖Complex.log (σ (α i))‖ ≤ 10 * (h i : ℝ))
    (hp : ∀ i, Real.log p ≤ (h i : ℝ))
    (hupper : Real.log (10 * (n : ℝ) * d * ((insert 1 (Finset.univ.image h)).max' (Finset.insert_nonempty ..) : ℚ)) ≤
      (logUpper : ℝ))
    (hΦ : yuConstantUpper n d p h logLower logUpper ≤ Φ)
    (b : Fin n → ℤ) (hb : b ≠ 0) (hne : ∏ i, (α i) ^ b i ≠ 1) :
    -(Real.log ‖ι (↑(∏ i, (α i) ^ b i) : K) - 1‖) / Real.log p <
      (Φ : ℝ) * Real.log ((d : ℝ) * max 3
        ((Finset.univ.sup (fun i => (b i).natAbs) : ℕ) : ℝ)) := by
  sorry

end ED2

namespace ED3

/-- Cremona's explicit constant for the full logarithmic x-height (§3.12). -/
def cremonaMu (W : WeierstrassCurve ℚ) [W.IsElliptic] : ℝ :=
  (Real.log |(W.Δ : ℝ)| + Real.log (max 1 |(W.j : ℝ)|)) / 6 +
    Real.log (max 1 |((W.b₂ / 12 : ℚ) : ℝ)|) +
    Real.log (if W.b₂ = 0 then 1 else 2)

/-- Cremona's two-sided estimate on every integral standard rational model (§3.12). -/
theorem canonicalHeight_sub_naiveHeight_cremona (W : WeierstrassCurve ℚ) [W.IsElliptic]
    (hW : ∀ a ∈ [W.a₁, W.a₂, W.a₃, W.a₄, W.a₆], IsIntegral ℤ a)
    (P : W.toAffine.Point) :
    -(Height.logHeight₁ W.j) / 12 - cremonaMu W - 961 / 500 ≤
      P.canonicalHeight - P.naiveHeight ∧
    P.canonicalHeight - P.naiveHeight ≤ cremonaMu W + 107 / 50 := by
  sorry

/-- The archimedean contribution to absolute logarithmic height, with local weights. -/
def archimedeanLogHeight {K : Type*} [Field K] [NumberField K] (x : K) : ℝ :=
  (∑ v : NumberField.InfinitePlace K, (v.mult : ℝ) * Real.log (max 1 (v x))) /
    Module.finrank ℚ K

/-- Silverman's number-field constant, in the native full x-height normalization. -/
def silvermanMu {K : Type*} [Field K] [NumberField K] [DecidableEq K]
    (W : WeierstrassCurve K) [W.IsElliptic] : ℝ :=
  NumberField.absLogHeight₁ W.Δ / 6 + archimedeanLogHeight W.j / 6 +
    archimedeanLogHeight (W.b₂ / 12) + Real.log (if W.b₂ = 0 then 1 else 2)

/-- Silverman's weighted number-field estimate, dividing both native heights by the degree. -/
theorem canonicalHeight_sub_naiveHeight_silverman {K : Type*} [Field K] [NumberField K]
    [DecidableEq K] (W : WeierstrassCurve K) [W.IsElliptic]
    (hW : ∀ a ∈ [W.a₁, W.a₂, W.a₃, W.a₄, W.a₆], IsIntegral ℤ a)
    (P : W.toAffine.Point) :
    -(NumberField.absLogHeight₁ W.j) / 12 - silvermanMu W - 973 / 500 ≤
      P.canonicalHeight / Module.finrank ℚ K - P.naiveHeight / Module.finrank ℚ K ∧
    P.canonicalHeight / Module.finrank ℚ K - P.naiveHeight / Module.finrank ℚ K ≤
      silvermanMu W + 107 / 50 := by
  sorry

/-- The subgroup generated by the specified torsion list and rational points. -/
def mordellWeilSubgroup (W : WeierstrassCurve.Affine ℚ) {r : ℕ}
    (T : Finset W.Point) (P : Fin r → W.Point) : AddSubgroup W.Point :=
  AddSubgroup.closure ((T : Set W.Point) ∪ Set.range P)

/-- Rank, height, Hermite and prime-saturation data yield a full basis and regulator (§3.22). -/
theorem mordellWeil_basis_of_height_and_saturation
    (W : WeierstrassCurve.Affine ℚ) [W.IsElliptic]
    (hW : ∀ a ∈ [W.a₁, W.a₂, W.a₃, W.a₄, W.a₆], IsIntegral ℤ a)
    {r : ℕ} (hr : 0 < r) (T : Finset W.Point) (P : Fin r → W.Point)
    (hT : ∀ Q : W.Point, Q ∈ T ↔ IsOfFinAddOrder Q)
    (hrank : Module.finrank ℤ W.Point ≤ r)
    (δ lam γ R : ℝ) (hδ : 0 < δ) (hlam : 0 < lam) (hγ : 0 < γ)
    (hdet : δ ≤ (Matrix.of fun i j =>
      WeierstrassCurve.Affine.neronTatePairing W (P i) (P j)).det)
    (hR : (Matrix.of fun i j =>
      WeierstrassCurve.Affine.neronTatePairing W (P i) (P j)).det ≤ R)
    (hlower : ∀ Q : W.Point, ¬ IsOfFinAddOrder Q → lam ≤ Q.canonicalHeight)
    (hhermite : ∀ M : Matrix (Fin r) (Fin r) ℝ, M.PosDef →
      ∃ x : Fin r → ℤ, x ≠ 0 ∧
        dotProduct (fun i => (x i : ℝ)) (M.mulVec (fun i => (x i : ℝ))) ≤
          γ * Real.rpow M.det (1 / (r : ℝ)))
    (N : ℕ) (hN : N = ⌊Real.sqrt R * Real.rpow (γ / lam) ((r : ℝ) / 2)⌋₊)
    (hsat : ∀ p : ℕ, p.Prime → p ≤ N → ∀ Q : W.Point,
      p • Q ∈ mordellWeilSubgroup W T P → Q ∈ mordellWeilSubgroup W T P) :
    letI : AddGroup.FG W.Point := WeierstrassCurve.Affine.fg_point_of_numberField
    mordellWeilSubgroup W T P = ⊤ ∧ Module.finrank ℤ W.Point = r ∧
      (∃ b : Module.Basis (Fin r) ℤ (WeierstrassCurve.Affine.PointModTorsion W),
        ∀ i, b i = Submodule.Quotient.mk (P i)) ∧
      WeierstrassCurve.Affine.regulator W = (Matrix.of fun i j =>
        WeierstrassCurve.Affine.neronTatePairing W (P i) (P j)).det := by
  sorry

end ED3

namespace ED6

/-- Series evaluation; the matching theorem uses it only on a disc of convergence. -/
def seriesValue {K : Type*} [NormedField K] (f : PowerSeries K) (x : K) : K :=
  ∑' i : ℕ, f.coeff i * x ^ i

/-- Quantitative matching after normalization, including every geometric multiplicity (§6.16). -/
theorem roots_determined_of_truncation {p : ℕ} [Fact p.Prime]
    {C : Type*} [NontriviallyNormedField C] [CompleteSpace C] [IsAlgClosed C]
    [IsUltrametricDist C] [NormedAlgebra ℚ_[p] C] [DecidableEq C]
    (G : PowerSeries ℚ_[p]) (hG : G.IsRestricted 1)
    (hcoeff : ∀ i, ‖G.coeff i‖ ≤ 1) (hunit : ∃ i, ‖G.coeff i‖ = 1)
    (H : Polynomial ℚ_[p]) (N d : ℕ) (hN : 0 < N) (hd : 0 < d)
    (herror : ∀ i, ‖G.coeff i - H.coeff i‖ ≤ (p : ℝ) ^ (-(N : ℤ)))
    (hmult : ∀ s : Finset C, (∀ z ∈ s, ‖z‖ ≤ 1) →
      ∑ z ∈ s, analyticOrderAt (seriesValue (G.map (algebraMap ℚ_[p] C))) z ≤
        (d : ℕ∞)) :
    ∃ roots : Multiset C,
      (∀ z : C, (roots.count z : ℕ∞) =
        if ‖z‖ ≤ 1 then
          analyticOrderAt (seriesValue (G.map (algebraMap ℚ_[p] C))) z else 0) ∧
      roots.card ≤ d ∧
      Multiset.Rel (fun x y : C => ‖x - y‖ ≤
        Real.rpow (p : ℝ) (-((N : ℝ) / d)))
        roots ((H.map (algebraMap ℚ_[p] C)).roots.filter (fun z => ‖z‖ ≤ 1)) := by
  sorry

end ED6

end TauCetiRoadmap.EffectiveDiophantineMethods
