import Mathlib
import TauCeti.NumberTheory.LocalField.Herbrand.Jump
import TauCeti.NumberTheory.LocalField.Discriminant.Basic
import TauCeti.NumberTheory.LocalField.Eisenstein.PowerBasis
import TauCeti.NumberTheory.LocalField.AbsoluteRamificationIndex
import TauCeti.NumberTheory.LocalField.Padic

/-!
# Ramification polygons, slopes and families of `p`-adic extensions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: the
invariants of Layer 0, the ramification polynomial and the root-difference valuations of Layer 1,
the orbit count and the upper breaks of Layer 2, the Galois mean slope of Layer 3, the indices of
inseparability and Miki decompositions of Layer 4, Krasner's closed form of Layer 5, Herbrand
invariants, their compatibility and Monge's count of Layer 6, and the Galois root discriminant of
Layer 7. The other targets, among them the rams, the Swan and Artin slopes, the slope content, the
hidden and top slopes, the jump set, the Herbrand invariant of an extension, families, the
Eisenstein-diagram point counts and masses, are specified with their definitions and Checks in
`README.md` only. Proofs are `sorry`, except `tameRamificationIndex_mul_pow_wildExponent` (Layer 0,
a bridge check on `pow_padicValNat_dvd`) and the closed numerical checks at the end of Layers 5
and 6 (`decide +kernel`, `simp`), which pin the closed-form counts and the slope dictionary to the
worked examples.

The carrier is Tau Ceti's local-field vocabulary at the pin: a base `K` with
`[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`, an extension
`L` with the same four instances and `[Algebra K L] [ValuativeExtension K L]`, Eisenstein
polynomials over `𝒪[K]` in Mathlib's `Polynomial.IsEisensteinAt 𝓂[K]`, `TauCeti.ramificationIndex`,
`TauCeti.inertiaDegree`, `TauCeti.discriminantExponent`, and the Herbrand package
`TauCeti.LocalFieldsRamification.upperRamificationGroup` on a Galois closure. No second
valuation, filtration, different or polygon is declared: the Newton polygon of the ramification
polynomial is `Polynomial.newtonPolygon` of `TauCeti/NumberTheory/NewtonPolygon/`, on `main`, and
is cited in `README.md` only.

Two conventions are visible in the signatures (`README.md`, *Pinned conventions*). First, every
slope, ram and mean is a `ℚ`, carried in a `List ℚ` indexed `1, …, w`, and the dictionary
`s_k − s_{k−1} = (r_k − r_{k−1})/(ε p^{k−1})`, `(p − 1) s_k = p m_k − m_{k−1}` is stated on
`HerbrandInvariant`, whose slopes are Swan slopes. Second, the **height** `c/f − e + 1` extends
Mass formula's wild exponent `IntermediateField.wildExponent` (Tau Ceti `main`, cited in
`README.md` 0.3) to every finite separable `L/K`, and the **mean** is `height/e`, so
`c = f(e − 1 + e·mean)` everywhere. The structure with numeric parameters (`HerbrandInvariant`)
comes with the non-vacuity constructor `HerbrandInvariant.ofDyadicZeta8`.
-/

namespace TauCetiRoadmap.PadicExtensionFamilies

open Polynomial ValuativeRel IsLocalRing TauCeti TauCeti.LocalFieldsRamification MeasureTheory
open scoped IntermediateField

noncomputable section

variable (K L : Type*) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] [Field L] [ValuativeRel L] [TopologicalSpace L]
  [IsNonarchimedeanLocalField L] [Algebra K L] [ValuativeExtension K L]

/-! ## Layer 0: the canonical tower and the invariants of the page header -/

/-- `README.md`, Layer 0, 0.1. The wild exponent `w = v_p(e)` of `L/K`, where `p` is the residue
characteristic and `e = ramificationIndex K L`. -/
def wildExponent : ℕ :=
  padicValNat (ringChar 𝓀[K]) (ramificationIndex K L)

/-- `README.md`, Layer 0, 0.1. The tame ramification index `ε = e / p^w`, prime to `p`. -/
def tameRamificationIndex : ℕ :=
  ramificationIndex K L / ringChar 𝓀[K] ^ wildExponent K L

omit [ValuativeExtension K L] in
/-- `README.md`, Layer 0, 0.1. `e = ε p^w`. This is the one closed proof of Layer 0: it is
`Nat.div_mul_cancel` on `pow_padicValNat_dvd`. -/
theorem tameRamificationIndex_mul_pow_wildExponent :
    tameRamificationIndex K L * ringChar 𝓀[K] ^ wildExponent K L = ramificationIndex K L :=
  Nat.div_mul_cancel pow_padicValNat_dvd

/-- `README.md`, Layer 0, 0.1. `p ∤ ε`. -/
theorem not_dvd_tameRamificationIndex :
    ¬ ringChar 𝓀[K] ∣ tameRamificationIndex K L := by
  sorry

/-- `README.md`, Layer 0, 0.1. Tame ramification is `w = 0`. -/
theorem isTamelyRamified_iff_wildExponent_eq_zero :
    IsTamelyRamified K L ↔ wildExponent K L = 0 := by
  sorry

section Separable

variable [Algebra.IsSeparable K L]

/-- `README.md`, Layer 0, 0.3. The height `H(L/K) = c/f − e + 1`, in truncated subtraction, which
`discriminantExponent_eq_height` shows is faithful. It extends Mass formula's
`IntermediateField.wildExponent` from totally ramified subextensions of `SeparableClosure K` to
every finite separable `L/K`; the agreement theorem is stated in `README.md` 0.3. Its invariance
under `K`-isomorphism follows from Tau Ceti's `discriminantExponent_eq_of_algEquiv` and specializes
to Mass formula's `IntermediateField.wildExponent_eq_of_algEquiv` (Tau Ceti `main`). -/
def height : ℕ :=
  discriminantExponent K L / inertiaDegree K L + 1 - ramificationIndex K L

/-- `README.md`, Layer 0, 0.3. The mean `m(L/K) = H(L/K)/e`. -/
def mean : ℚ :=
  (height K L : ℚ) / ramificationIndex K L

/-- `README.md`, Layer 0, 0.3. `c = f (e − 1) + f · H`. -/
theorem discriminantExponent_eq_height :
    discriminantExponent K L =
      inertiaDegree K L * (ramificationIndex K L - 1) + inertiaDegree K L * height K L := by
  sorry

/-- `README.md`, Layer 0, 0.3. The height vanishes exactly in the tame case: the tame criterion
through `discriminantExponent_eq_inertiaDegree_mul_differentExponent`. -/
theorem height_eq_zero_iff : height K L = 0 ↔ IsTamelyRamified K L := by
  sorry

/-- `README.md`, Layer 0, 0.3. The wild upper bound, `H ≤ e · v_L(e)`, when `(e : L) ≠ 0`. -/
theorem height_le_mul_natCastValuation (he : (ramificationIndex K L : L) ≠ 0) :
    height K L ≤ ramificationIndex K L * natCastValuation L (ramificationIndex K L) he := by
  sorry

end Separable

/-! ## Layer 1: the ramification polynomial and residual polynomials -/

variable {K L} in
/-- `README.md`, Layer 1, 1.1. The ramification polynomial `ρ(x) = α^{-n} φ(α x + α)` of a
polynomial `φ` over `𝒪[K]` and an element `α : L`, with `n = natDegree φ`. For `φ` Eisenstein
with root `α`, `ρ` is monic of degree `n`, `ρ(0) = 0`, and its roots are `(α' − α)/α` over the
conjugates `α'` of `α`. -/
def ramificationPolynomial (φ : 𝒪[K][X]) (α : L) : L[X] :=
  C (α⁻¹ ^ φ.natDegree) *
    (φ.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).comp (C α * X + C α)

variable {K L} in
/-- `README.md`, Layer 1, 1.1. For an Eisenstein polynomial with a root `α ≠ 0`, the ramification
polynomial is monic of the same degree. -/
theorem ramificationPolynomial_monic {φ : 𝒪[K][X]} (hφ : φ.IsEisensteinAt 𝓂[K]) {α : L}
    (hα : α ≠ 0) : (ramificationPolynomial φ α).Monic := by
  sorry

variable {K L} in
/-- `README.md`, Layer 1, 1.1. The ramification polynomial vanishes at `0` when `α` is a root. -/
theorem ramificationPolynomial_eval_zero {φ : 𝒪[K][X]} {α : L}
    (hroot : (φ.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).IsRoot α) :
    (ramificationPolynomial φ α).eval 0 = 0 := by
  sorry

/-- The additive normalized valuation of an element of a local field, `v_M(x) ∈ ℤ`, with the junk
value `0` at `x = 0`. It is `Multiplicative.toAdd` of `TauCeti.normalizedValuation`, so a
uniformizer has value `1`. -/
def addValInt (M : Type*) [Field M] [ValuativeRel M] [TopologicalSpace M]
    [IsNonarchimedeanLocalField M] (x : M) : ℤ := by
  classical
  exact if h : x = 0 then 0 else Multiplicative.toAdd (normalizedValuation M (Units.mk0 x h))

section Closure

variable (M : Type*) [Field M] [ValuativeRel M] [TopologicalSpace M]
  [IsNonarchimedeanLocalField M] [Algebra K M] [Algebra L M] [IsScalarTower K L M]
  [ValuativeExtension K M] [ValuativeExtension L M] [Module.Finite K L]

/-- `README.md`, Layer 1, 1.2 and Layer 2, 2.5. The multiset of root-difference valuations
`v_M(σ ξ − ξ)/e(M/L) − 1` over the `K`-embeddings `σ ≠ incl` of `L` into `M`. For `L/K` totally
ramified and `ξ` a uniformizer of `L` these are the valuations of the nonzero roots of the
ramification polynomial, that is the negatives of its Newton slopes, each listed as often as the
corresponding face is long; 2.5 identifies them with the lower breaks of `L/K`. -/
def conjugateBreaks (ξ : L) : Multiset ℚ := by
  classical
  exact ((Finset.univ : Finset (L →ₐ[K] M)).filter
      (fun σ => σ ≠ IsScalarTower.toAlgHom K L M)).val.map
    fun σ => (addValInt M (σ ξ - algebraMap L M ξ) : ℚ) / ramificationIndex L M - 1

/-- `README.md`, Layer 1, 1.2. Independence of the uniformizer: two uniformizers of `L` give the
same multiset of root-difference valuations. -/
theorem conjugateBreaks_eq_of_irreducible {ξ ξ' : 𝒪[L]} (hξ : Irreducible ξ)
    (hξ' : Irreducible ξ') :
    conjugateBreaks K L M (ξ : L) = conjugateBreaks K L M (ξ' : L) := by
  sorry

/-- `README.md`, Layer 1, 1.2. For `L/K` totally ramified and `ξ` a uniformizer, every
root-difference valuation is nonnegative, and exactly `n − p^w` of them vanish (the tame
segment). -/
theorem card_filter_conjugateBreaks_eq_zero (h : IsTotallyRamified K L) {ξ : 𝒪[L]}
    (hξ : Irreducible ξ) :
    ((conjugateBreaks K L M (ξ : L)).filter (· = 0)).card =
      Module.finrank K L - ringChar 𝓀[K] ^ wildExponent K L := by
  sorry

end Closure

variable {K L} in
/-- `README.md`, Layer 1, 1.2 and Convention 7. The abscissae `k < k + l` bound a segment of
slope `−h/m` of the Newton polygon of `ρ` (points `(i, v_L(ρ_i))`, Convention 4): both endpoint
coefficients are nonzero, the chord from `(k, v_L(ρ_k))` to `(k + l, v_L(ρ_{k+l}))` has slope
`−h/m`, and every point of the polygon lies on or above that chord's line. Stated on `addValInt`
so that it needs no polygon API; 1.2 identifies it with the faces of `Polynomial.newtonPolygon`.
The ram of the segment is `h/m`. -/
def IsPolygonSegment (ρ : L[X]) (k l h m : ℕ) : Prop :=
  0 < l ∧ 0 < m ∧ ρ.coeff k ≠ 0 ∧ ρ.coeff (k + l) ≠ 0 ∧
    (m : ℚ) * (addValInt L (ρ.coeff (k + l)) - addValInt L (ρ.coeff k)) = -(h : ℚ) * l ∧
    ∀ i, ρ.coeff i ≠ 0 →
      -(h : ℚ) * ((i : ℚ) - k) ≤ (m : ℚ) * (addValInt L (ρ.coeff i) - addValInt L (ρ.coeff k))

variable {K L} in
/-- `README.md`, Layer 1, 1.3. Ore's residual polynomial of the segment of the ramification
polygon with left abscissa `k`, length `l` and slope `h/m` in lowest terms, with respect to the
uniformizer `α` (a root of the Eisenstein polynomial `φ`):
`A(x) = Σ_{j=0}^{l/m} \overline{ρ_{jm+k} α^{jh − v_α(ρ_k)}} x^j ∈ 𝓀[L][x]`.
The residue of an element outside `𝒪[L]` is taken to be `0`; on a genuine segment every
coefficient is integral. -/
def residualPolynomial (φ : 𝒪[K][X]) (α : L) (k l h m : ℕ) : 𝓀[L][X] := by
  classical
  exact ∑ j ∈ Finset.range (l / m + 1),
    C (let x : L := (ramificationPolynomial φ α).coeff (j * m + k) *
          α ^ ((j * h : ℤ) - addValInt L ((ramificationPolynomial φ α).coeff k))
        if hx : x ∈ 𝒪[L] then residue 𝒪[L] ⟨x, hx⟩ else 0) * X ^ j

variable {K L} in
/-- `README.md`, Layer 1, 1.3. On a segment of positive slope `h/m`, `x^k A(x^m)` is an additive
polynomial over `𝓀[L]`: its nonzero coefficients sit at `p`-power exponents. -/
theorem residualPolynomial_additive {φ : 𝒪[K][X]} (hφ : φ.IsEisensteinAt 𝓂[K]) {α : L}
    (hroot : (φ.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).IsRoot α)
    (hgen : K⟮α⟯ = ⊤) {k l h m : ℕ} (hh : 0 < h) (hcop : h.Coprime m)
    (hseg : IsPolygonSegment (ramificationPolynomial φ α) k l h m) {j : ℕ}
    (hj : (residualPolynomial φ α k l h m).coeff j ≠ 0) :
    ∃ i : ℕ, k + j * m = ringChar 𝓀[K] ^ i := by
  sorry

variable {K L} in
/-- `README.md`, Layer 1, 1.4. The associated inertia of a residual polynomial: the lcm of the
degrees of its irreducible factors over `𝓀[L]`. -/
def associatedInertiaOf (A : 𝓀[L][X]) : ℕ := by
  classical
  exact (UniqueFactorizationMonoid.normalizedFactors A).toFinset.lcm Polynomial.natDegree

/-! ## Layer 2: breaks of a separable extension and the slope polygon -/

section Breaks

variable (M : Type*) [Field M] [ValuativeRel M] [TopologicalSpace M]
  [IsNonarchimedeanLocalField M] [Algebra K M] [Algebra L M] [IsScalarTower K L M]
  [ValuativeExtension K M] [Module.Finite K M] [IsGalois K M]

/-- `README.md`, Layer 2, 2.1. The subgroup `H = Gal(M/L)` of `G = Gal(M/K)`, as the fixing
subgroup of the image of `L` in a Galois closure `M`. -/
def embeddingSubgroup : Subgroup (M ≃ₐ[K] M) :=
  (IsScalarTower.toAlgHom K L M).fieldRange.fixingSubgroup

/-- `README.md`, Layer 2, 2.1. The orbit count `[G : G^u H]`: the number of orbits of the upper
ramification group `G^u` of `M/K` on the `K`-embeddings `G/H = Hom_K(L, M)`. -/
def embeddingOrbitCount (u : RamificationIndexDomain) : ℕ :=
  (upperRamificationGroup K M u ⊔ embeddingSubgroup K L M).index

/-- `README.md`, Layer 2, 2.1. The orbit count is `[L : K]` for `u` large. -/
theorem embeddingOrbitCount_eq_finrank_of_large :
    ∃ U : ℝ, ∀ u : RamificationIndexDomain, U ≤ (u : ℝ) →
      embeddingOrbitCount K L M u = Module.finrank K L := by
  sorry

/-- `README.md`, Layer 2, 2.2. An upper break of `L/K`: `G^u H ≠ G^{u'} H` for every `u' > u`.
For `L/K` Galois this is Tau Ceti's `UpperJump K L u` (`isUpperBreak_iff_upperJump`). -/
def IsUpperBreak (u : RamificationIndexDomain) : Prop :=
  ∀ v : RamificationIndexDomain, u < v →
    upperRamificationGroup K M v ⊔ embeddingSubgroup K L M <
      upperRamificationGroup K M u ⊔ embeddingSubgroup K L M

/-- `README.md`, Layer 2, 2.3. **The discriminant exponent as an upper-numbering integral.**
`c(L/K) = ∫_{-1}^{∞} ([L : K] − [G : G^u H]) du`, Serre's `IV §1, Prop. 4` through Herbrand's
change of variables. The integrand is read at `max u (−1)` so that it is defined on all of `ℝ`;
it vanishes for `u` large by `embeddingOrbitCount_eq_finrank_of_large`. -/
theorem discriminantExponent_eq_integral [Algebra.IsSeparable K L] :
    (discriminantExponent K L : ℝ) =
      ∫ u in Set.Ioi (-1 : ℝ),
        ((Module.finrank K L : ℝ) -
          embeddingOrbitCount K L M ⟨max u (-1), le_max_right u (-1)⟩) := by
  sorry

end Breaks

/-! ## Layer 3: the invariants of the Galois closure -/

section GaloisClosure

variable [Module.Finite K L] (M : Type*) [Field M] [ValuativeRel M] [TopologicalSpace M]
  [IsNonarchimedeanLocalField M] [Algebra K M] [Algebra L M] [IsScalarTower K L M]
  [ValuativeExtension K M] [Module.Finite K M] [IsGalois K M]

/-- `README.md`, Layer 3, 3.1. The **slope content** `[s_1, …, s_k]_t^u` of `L/K`, read on a
Galois closure `M`: the Artin slopes of `M/K`, the Galois tame degree `t = ε(M/K)` and the
Galois unramified degree `u = f(M/K)`. -/
structure SlopeContent where
  /-- The Galois Artin slopes, with multiplicity. -/
  artinSlopes : Multiset ℚ
  /-- The Galois tame degree `t`. -/
  tameDegree : ℕ
  /-- The Galois unramified degree `u`. -/
  unramifiedDegree : ℕ

/-- `README.md`, Layer 3, 3.3. The **Galois mean slope** `c(M/K)/[M : K]`. -/
def galoisMeanSlope : ℚ :=
  (discriminantExponent K M : ℚ) / Module.finrank K M

/-- `README.md`, Layer 3, 3.3. The Galois mean slope is `0` exactly for an unramified extension
and `1 − 1/t` exactly for a tamely ramified one. -/
theorem galoisMeanSlope_eq_one_sub_inv_iff :
    galoisMeanSlope K M = 1 - 1 / (tameRamificationIndex K M : ℚ) ↔ IsTamelyRamified K M := by
  sorry

end GaloisClosure

section Padic

variable (p : ℕ) [Fact p.Prime]

/-- A finite extension of `ℚ_[p]` is separable, `ℚ_[p]` being perfect. Declared so that
`discriminantExponent ℚ_[p] L` finds its `Algebra.IsSeparable` instance through
`FinitePadicExtension` at once. -/
instance instIsSeparablePadic (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [FinitePadicExtension L p] : Algebra.IsSeparable ℚ_[p] L :=
  Algebra.IsAlgebraic.isSeparable_of_perfectField

/-- `README.md`, Layer 3, 3.5. A **Galois splitting model** of a `p`-adic field `L`: an
irreducible `g ∈ ℚ[X]` with `L ≅ ℚ_p[X]/(g)` whose Galois group over `ℚ_p` has the order of its
Galois group over `ℚ`. -/
def IsGaloisSplittingModel (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [FinitePadicExtension L p] (g : ℚ[X]) : Prop :=
  Irreducible g ∧ Nonempty (L ≃ₐ[ℚ_[p]] AdjoinRoot (g.map (algebraMap ℚ ℚ_[p]))) ∧
    Nat.card (g.map (algebraMap ℚ ℚ_[p])).Gal = Nat.card g.Gal

/-- `README.md`, Layer 3, 3.6. The intrinsic **label prefix** `(p, f, e, c)` of a `p`-adic
field. The letters and indices of an LMFDB label are not defined here. -/
def labelPrefix (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [FinitePadicExtension L p] : ℕ × ℕ × ℕ × ℕ :=
  (p, inertiaDegree ℚ_[p] L, ramificationIndex ℚ_[p] L, discriminantExponent ℚ_[p] L)

/-- `README.md`, Layer 3, 3.6. The bounds `f(e − 1) ≤ c ≤ f(e − 1 + e v_p(e))` on the prefix. -/
theorem labelPrefix_bounds (L : Type*) [Field L] [ValuativeRel L] [TopologicalSpace L]
    [IsNonarchimedeanLocalField L] [FinitePadicExtension L p] :
    let f := inertiaDegree ℚ_[p] L
    let e := ramificationIndex ℚ_[p] L
    f * (e - 1) ≤ discriminantExponent ℚ_[p] L ∧
      discriminantExponent ℚ_[p] L ≤ f * (e - 1 + e * padicValNat p e) := by
  sorry

end Padic

/-! ## Layer 4: indices of inseparability and jump sets -/

variable {K L} in
/-- `README.md`, Layer 4, 4.1. Heiermann's auxiliary indices `i_j^{π}` of an Eisenstein
polynomial `φ` of degree `n = ε p^ν` (the minimal polynomial of a uniformizer `π` of a totally
ramified `L/K`): `min { n v_K(φ_h) + h − n : 0 ≤ h ≤ n − 1, \bar v_p(h) ≤ j }`, where
`\bar v_p(h) = min(v_p(h), ν)` and `\bar v_p(0) = ν`. -/
def indexOfInseparabilityAt (φ : 𝒪[K][X]) (j : ℕ) : ℕ∞ :=
  let n := φ.natDegree
  let p := ringChar 𝓀[K]
  let ν := padicValNat p n
  ⨅ (h : Fin n) (_ : (h.1 = 0 ∧ j = ν) ∨ (h.1 ≠ 0 ∧ min (padicValNat p h.1) ν ≤ j)),
    ((n : ℕ∞) * IsDiscreteValuationRing.addVal 𝒪[K] (φ.coeff h.1) + h.1 - n)

variable {K L} in
/-- `README.md`, Layer 4, 4.1 and Convention 12. The `j`-th **index of inseparability**
`i_j = min { i_{j'}^{π} + (j' − j) e_L : j ≤ j' ≤ ν }`, with `e_L = v_L(p)` in mixed
characteristic and `e_L = ∞` in equal characteristic; `L/K` is totally ramified with Eisenstein
polynomial `φ` and `e(L/K) = n`. -/
def indexOfInseparability (φ : 𝒪[K][X]) (j : ℕ) : ℕ∞ := by
  classical
  exact
    let p := ringChar 𝓀[K]
    let ν := padicValNat p φ.natDegree
    let eL : ℕ∞ := if hp : (p : L) = 0 then ⊤ else natCastValuation L p hp
    ⨅ (j' : ℕ) (_ : j ≤ j' ∧ j' ≤ ν), indexOfInseparabilityAt φ j' + (j' - j : ℕ) * eL

variable {K L} in
/-- `README.md`, Layer 4, 4.1. The indices are independent of the uniformizer: two Eisenstein
polynomials of the same totally ramified extension give the same `i_j`. -/
theorem indexOfInseparability_eq_of_eisenstein {φ φ' : 𝒪[K][X]} (hφ : φ.IsEisensteinAt 𝓂[K])
    (hφ' : φ'.IsEisensteinAt 𝓂[K]) {α α' : L}
    (hα : (φ.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).IsRoot α)
    (hα' : (φ'.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).IsRoot α')
    (hgen : K⟮α⟯ = ⊤) (hgen' : K⟮α'⟯ = ⊤) (j : ℕ) :
    indexOfInseparability (L := L) φ j = indexOfInseparability (L := L) φ' j := by
  sorry

variable {K L} in
/-- `README.md`, Layer 4, 4.1. `i_0` is the height (the wild exponent of the discriminant) and
`i_ν = 0`. -/
theorem indexOfInseparability_zero_and_last [Algebra.IsSeparable K L] {φ : 𝒪[K][X]}
    (hφ : φ.IsEisensteinAt 𝓂[K]) {α : L}
    (hα : (φ.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).IsRoot α) (hgen : K⟮α⟯ = ⊤) :
    indexOfInseparability (L := L) φ 0 = (height K L : ℕ∞) ∧
      indexOfInseparability (L := L) φ (padicValNat (ringChar 𝓀[K]) φ.natDegree) = 0 := by
  sorry

/-- `README.md`, Layer 4, 4.2. A **Miki decomposition** of a primitive `p`-th root of unity
`ζ ∈ K`, for `e = v_K(p)` and `r = v_p(e)`: units `α_0, …, α_r` with
`ζ = α_0^{p^r} α_1^{p^{r−1}} ⋯ α_r`, each either `1`, or of level `v_K(α_i − 1) < pe/(p−1)` prime
to `p`, or of level exactly `pe/(p−1)` and not a `p`-th power. -/
structure MikiDecomposition (p : ℕ) [Fact p.Prime] [FinitePadicExtension K p] (ζ : K) where
  /-- The factors `α_0, …, α_r`, indexed by `Fin (r + 1)`. -/
  factor : Fin (padicValNat p (absoluteRamificationIndex K p) + 1) → Kˣ
  /-- The product identity `ζ = Π α_i^{p^{r−i}}`. -/
  prod_eq : ∏ i, (factor i : K) ^ p ^ (padicValNat p (absoluteRamificationIndex K p) - i.1) = ζ
  /-- Each factor is `1`, a generator below the top level, or a non-`p`-th-power at the top. -/
  level : ∀ i, factor i = 1 ∨
    ((p - 1) * addValInt K ((factor i : K) - 1) < p * absoluteRamificationIndex K p ∧
      ¬ (p : ℤ) ∣ addValInt K ((factor i : K) - 1)) ∨
    ((p - 1) * addValInt K ((factor i : K) - 1) = p * absoluteRamificationIndex K p ∧
      ∀ y : K, y ^ p ≠ (factor i : K))

/-- `README.md`, Layer 4, 4.2. Miki's theorem: a decomposition exists. -/
theorem exists_mikiDecomposition (p : ℕ) [Fact p.Prime] [FinitePadicExtension K p] {ζ : K}
    (hζ : IsPrimitiveRoot ζ p) : Nonempty (MikiDecomposition K p ζ) := by
  sorry

/-! ## Layer 5: Krasner's count by degree and discriminant -/

/-- The valuation `v_K(h)` of a natural number in `K`, as `⊤` when `(h : K) = 0`. -/
def natValuation (h : ℕ) : ℕ∞ := by
  classical
  exact if hh : (h : K) = 0 then ⊤ else natCastValuation K h hh

/-- `README.md`, Layer 5, 5.1. **Ore's conditions** on a wild exponent `j = a n + b`,
`0 ≤ b < n`: either `b = 0` and `a = v_K(n)`, or `b > 0`, `v_K(b) ≤ a` and `a + 1 ≤ v_K(n)`. -/
def IsOreAdmissible (n j : ℕ) : Prop :=
  (j % n = 0 ∧ ((j / n : ℕ) : ℕ∞) = natValuation K n) ∨
    (0 < j % n ∧ natValuation K (j % n) ≤ ((j / n : ℕ) : ℕ∞) ∧
      ((j / n : ℕ) : ℕ∞) + 1 ≤ natValuation K n)

/-- `README.md`, Layer 5, 5.3. **Krasner's closed form over `ℚ_p`**: for `j = a n + b`, the
number of totally ramified extensions of degree `n` and wild exponent `j` of a field with residue
cardinality `q` and `v_K = v_p` is `n q^{Σ_{i=1}^{a} n/p^i}` if `b = 0` and
`n (q − 1) q^{Σ_{i=1}^{a} n/p^i + ⌊b/p^{a+1}⌋}` if `b > 0`, for Ore-admissible `j`, and `0`
otherwise. Over `ℚ_p` the admissibility is `(b = 0 ∧ a = v_p(n)) ∨ (b > 0 ∧ v_p(b) ≤ a < v_p(n))`. -/
def krasnerClosedForm (p q n j : ℕ) : ℕ :=
  let a := j / n
  let b := j % n
  let admissible := (b = 0 ∧ a = padicValNat p n) ∨ (0 < b ∧ padicValNat p b ≤ a ∧ a < padicValNat p n)
  if admissible then
    (if b = 0 then n * q ^ (∑ i ∈ Finset.range a, n / p ^ (i + 1))
     else n * (q - 1) * q ^ ((∑ i ∈ Finset.range a, n / p ^ (i + 1)) + b / p ^ (a + 1)))
  else 0

/-- `README.md`, Layer 5, 5.3. **Consistency with Serre's Theorem 1**: summing Krasner's closed
form against `q^{-j}` gives `n`, for `q` a power of the prime `p`. -/
theorem sum_krasnerClosedForm_div_pow (p q n : ℕ) (hp : p.Prime) (hq : ∃ f, 0 < f ∧ q = p ^ f)
    (hn : 0 < n) :
    ∑ j ∈ Finset.range (n * padicValNat p n + 1), (krasnerClosedForm p q n j : ℚ) / q ^ j = n := by
  sorry

/-- The worked values of 5.3 over `ℚ_2`, `n = 4`: counts `4, 8, 16, 16, 16, 32` at
`j = 1, 3, 5, 6, 7, 8` and `0` at the non-admissible `j = 2, 4`. These are closed proofs. -/
example : krasnerClosedForm 2 2 4 1 = 4 ∧ krasnerClosedForm 2 2 4 2 = 0 ∧
    krasnerClosedForm 2 2 4 3 = 8 ∧ krasnerClosedForm 2 2 4 4 = 0 ∧
    krasnerClosedForm 2 2 4 5 = 16 ∧ krasnerClosedForm 2 2 4 6 = 16 ∧
    krasnerClosedForm 2 2 4 7 = 16 ∧ krasnerClosedForm 2 2 4 8 = 32 := by
  decide +kernel

/-- The worked values of 5.3 over `ℚ_3`, `n = 3`: `6, 6, 9`. -/
example : krasnerClosedForm 3 3 3 1 = 6 ∧ krasnerClosedForm 3 3 3 2 = 6 ∧
    krasnerClosedForm 3 3 3 3 = 9 := by
  decide +kernel

/-! ## Layer 6: Herbrand invariants, families and masses -/

/-- `README.md`, Layer 6, 6.1. A **Herbrand invariant** `[s_1, …, s_w]_ε^f` for the prime `p`: a
tame index `ε` prime to `p`, a residue degree `f`, and a nondecreasing list of positive Swan
slopes. -/
structure HerbrandInvariant (p : ℕ) where
  /-- The tame ramification index `ε`. -/
  tameIndex : ℕ
  /-- The residue degree `f`. -/
  residueDegree : ℕ
  /-- The Swan slopes `s_1 ≤ ⋯ ≤ s_w`. -/
  slopes : List ℚ
  tameIndex_pos : 0 < tameIndex
  not_dvd_tameIndex : ¬ p ∣ tameIndex
  residueDegree_pos : 0 < residueDegree
  slopes_sorted : slopes.SortedLE
  slopes_pos : ∀ s ∈ slopes, 0 < s

namespace HerbrandInvariant

variable {p : ℕ} (I : HerbrandInvariant p)

/-- The wild exponent `w`, the number of slopes. -/
def w : ℕ := I.slopes.length

/-- The ramification index `e = ε p^w`. -/
def e : ℕ := I.tameIndex * p ^ I.w

/-- The degree `n = e f`. -/
def n : ℕ := I.e * I.residueDegree

/-- `README.md`, Convention 5. The **means** `m_k = Σ_{j ≤ k} (p − 1) s_j / p^{k+1−j}`. -/
def means : List ℚ :=
  (List.range I.w).map fun k =>
    ∑ j ∈ Finset.range (k + 1), ((p : ℚ) - 1) * I.slopes.getD j 0 / (p : ℚ) ^ (k + 1 - j)

/-- `README.md`, Convention 5. The **rams** `r_k = ε p^k (m_k − m_{k−1})/(p − 1)`, `m_0 = 0`. -/
def rams : List ℚ :=
  (List.range I.w).map fun k =>
    (I.tameIndex : ℚ) * (p : ℚ) ^ (k + 1) *
      (I.means.getD k 0 - (if k = 0 then 0 else I.means.getD (k - 1) 0)) / ((p : ℚ) - 1)

/-- `README.md`, Convention 5. The **small rams** `r_k^* = (p − 1) r_k/(ε p^k)`. -/
def smallRams : List ℚ :=
  (List.range I.w).map fun k => ((p : ℚ) - 1) * I.rams.getD k 0 / (I.tameIndex * (p : ℚ) ^ (k + 1))

/-- The wild exponent (height) `H = e · m_w` of every member of the family. -/
def height : ℚ := I.e * I.means.getLastD 0

/-- The discriminant exponent `c = f(e − 1 + H)` of every member of the family. -/
def discriminantExponent : ℚ := I.residueDegree * (I.e - 1 + I.height)

/-- `README.md`, Layer 6, 6.1. `(p − 1) s_k = p m_k − m_{k−1}`. -/
theorem slopes_eq_means (hp : p.Prime) (k : ℕ) (hk : k < I.w) :
    ((p : ℚ) - 1) * I.slopes.getD k 0 =
      p * I.means.getD k 0 - (if k = 0 then 0 else I.means.getD (k - 1) 0) := by
  sorry

/-- `README.md`, Layer 6, 6.1. `s_k − s_{k−1} = (r_k − r_{k−1})/(ε p^{k−1})`. -/
theorem slopes_sub_eq_rams_sub (hp : p.Prime) (k : ℕ) (hk : k < I.w) :
    I.slopes.getD k 0 - (if k = 0 then 0 else I.slopes.getD (k - 1) 0) =
      (I.rams.getD k 0 - (if k = 0 then 0 else I.rams.getD (k - 1) 0)) /
        (I.tameIndex * (p : ℚ) ^ k) := by
  sorry

/-- `README.md`, Layer 6, 6.1. `r_k^* = m_k − m_{k−1}`. -/
theorem smallRams_eq_means_sub (hp : p.Prime) (k : ℕ) (hk : k < I.w) :
    I.smallRams.getD k 0 = I.means.getD k 0 - (if k = 0 then 0 else I.means.getD (k - 1) 0) := by
  sorry

/-- Non-vacuity: the Herbrand invariant `[1, 2]` of `ℚ_2(ζ_8)/ℚ_2`, with `ε = f = 1`. -/
def ofDyadicZeta8 : HerbrandInvariant 2 where
  tameIndex := 1
  residueDegree := 1
  slopes := [1, 2]
  tameIndex_pos := Nat.one_pos
  not_dvd_tameIndex := by decide
  residueDegree_pos := Nat.one_pos
  slopes_sorted := by simp [List.sortedLE_cons, List.sortedLE_nil]
  slopes_pos := by simp

/-- The means `⟨1/2, 5/4⟩` and rams `(1, 3)` of `ℚ_2(ζ_8)` (`README.md`, worked examples), as a
closed check of the dictionary. -/
example : ofDyadicZeta8.means = [1/2, 5/4] ∧ ofDyadicZeta8.rams = [1, 3] := by
  simp [means, rams, ofDyadicZeta8, w, List.range_succ, Finset.sum_range_succ]
  norm_num

end HerbrandInvariant

section Families

variable {K}

variable (K) in
/-- `README.md`, Layer 6, 6.2. **Compatibility** of a Herbrand invariant with the base field, a
condition on its distinct rams `b_1 < ⋯ < b_t` with multiplicities `d_i` and on `e_K`: each
`(p^{d_i} − 1) b_i` is an integer, and `b_i` is either geometric (prime to `p` after clearing,
and below `p^{d_1+⋯+d_{i−1}+1} ε e_K/(p − 1)`) or arithmetic (`d_i = 1` and equal to that
bound). -/
def IsCompatible (p : ℕ) [Fact p.Prime] [FinitePadicExtension K p] (I : HerbrandInvariant p) :
    Prop :=
  let bs := I.rams.dedup
  ∀ i : Fin bs.length,
    let b := bs.get i
    let d := I.rams.count b
    let before := ∑ i' ∈ Finset.range i.1, I.rams.count (bs.getD i' 0)
    let bound : ℚ := (p : ℚ) ^ (before + 1) * I.tameIndex * absoluteRamificationIndex K p / (p - 1)
    ∃ m : ℕ, ((p ^ d - 1 : ℕ) : ℚ) * b = m ∧
      ((¬ p ∣ m ∧ b < bound) ∨ (d = 1 ∧ b = bound))

end Families

/-- `README.md`, Layer 6, 6.7. **Monge's count** `N_p(e, f)` of `ℚ_p`-isomorphism classes of
extensions with ramification index `e` and residue degree `f`, in the closed form the LMFDB
evaluates; `φ` is Euler's function. -/
def mongeCount (p e f : ℕ) : ℚ :=
  let eps : ℕ → ℚ := fun i => ∑ j ∈ Finset.range i, (p : ℚ)⁻¹ ^ (j + 1)
  let ee : ℕ → ℕ := fun i => Nat.totient (p ^ i)
  let sig : ℕ → ℕ → ℕ → ℕ → ℚ := fun n0 e' f' s =>
    1 + ∑ i ∈ Finset.range s, (p : ℚ) ^ (i + 1) *
      ((p : ℚ) ^ ((eps (i + 1) * (n0 * e' * f' : ℕ) : ℚ)).num.toNat -
        (p : ℚ) ^ ((eps i * (n0 * e' * f' : ℕ) : ℚ)).num.toNat)
  let delta : ℕ → ℕ → ℕ → ℚ := fun m s i =>
    if s = 0 ∧ i = 0 then 1
    else if 0 < s ∧ i = 0 then ((p : ℚ) ^ m - 1) * (p : ℚ) ^ (m * (s - 1))
    else if i < s ∧ 0 < i then ((p : ℚ) - 1) * ((p : ℚ) ^ m - 1) * (p : ℚ) ^ (m * (s - 1) + i - 1)
    else if s = i ∧ 0 < i then ((p : ℚ) - 1) * (p : ℚ) ^ (m * s + s - 1)
    else 0
  let term : ℕ → ℕ → ℕ → ℚ := fun i fp ep =>
    if (ee i * ep) ∣ e then
      let epp := e / (ee i * ep)
      let eppVal := padicValNat p epp
      let eppUnit := epp / p ^ eppVal
      let a : ℚ := if eppUnit ∣ (p ^ fp - 1) then 1 else 0
      a * Nat.totient eppUnit * Nat.totient (f / fp) / ee i *
        sig (ee i) ep fp (padicValNat p ep) * delta (ee i * ep * fp) eppVal i
    else 0
  (1 / (f : ℚ)) * ∑ i ∈ Finset.range (padicValNat p e + 1), ∑ fp ∈ f.divisors, ∑ ep ∈ e.divisors,
    term i fp ep

/-- `README.md`, Layer 6, 6.7. The acceptance values of Monge's count. -/
theorem mongeCount_values :
    mongeCount 2 2 1 = 6 ∧ mongeCount 2 4 1 = 48 ∧ mongeCount 2 2 2 = 10 ∧
      mongeCount 3 3 1 = 9 ∧ mongeCount 2 8 1 = 1544 ∧ mongeCount 5 5 1 = 25 := by
  sorry

/-! ## Layer 7: the Galois root discriminant -/

section GaloisRootDiscriminant

variable (F : Type*) [Field F] [NumberField F]

/-- `README.md`, Layer 7. The Galois closure of a number field inside an algebraic closure. -/
abbrev galoisClosure : IntermediateField ℚ (AlgebraicClosure F) :=
  IntermediateField.normalClosure ℚ F (AlgebraicClosure F)

instance : NumberField (galoisClosure F) where
  to_charZero := inferInstance
  to_finiteDimensional := inferInstance

/-- `README.md`, Layer 7, 7.1. The **Galois root discriminant** of a number field: the root
discriminant of its Galois closure. -/
def galoisRootDiscriminant : ℝ :=
  NumberField.rootDiscr (galoisClosure F)

/-- `README.md`, Layer 7, 7.2. The **Galois mean slope of `F` at `p`**:
`v_p(disc F^{gal}) / [F^{gal} : ℚ]`, which 7.2 identifies with the Galois mean slope of the
completion of the closure at any prime above `p`. -/
def galoisMeanSlopeAt (p : ℕ) : ℚ :=
  (padicValInt p (NumberField.discr (galoisClosure F)) : ℚ) / Module.finrank ℚ (galoisClosure F)

/-- `README.md`, Layer 7, 7.1. For a Galois number field the Galois root discriminant is the root
discriminant. -/
theorem galoisRootDiscriminant_eq_rootDiscr [IsGalois ℚ F] :
    galoisRootDiscriminant F = NumberField.rootDiscr F := by
  sorry

/-- `README.md`, Layer 7, 7.1. The root discriminant does not exceed the Galois root
discriminant. -/
theorem rootDiscr_le_galoisRootDiscriminant :
    NumberField.rootDiscr F ≤ galoisRootDiscriminant F := by
  sorry

/-- `README.md`, Layer 7, 7.3. **The product formula**:
`galoisRootDiscriminant F = Π_{p | disc F} p^{gms_p(F)}`. -/
theorem galoisRootDiscriminant_eq_prod :
    galoisRootDiscriminant F =
      ∏ p ∈ (NumberField.discr F).natAbs.primeFactors, (p : ℝ) ^ (galoisMeanSlopeAt F p : ℝ) := by
  sorry

/-- `README.md`, Layer 7, 7.2. The Galois mean slope at `p` vanishes exactly when `p` is
unramified in `F`, that is, when `p` does not divide the discriminant. -/
theorem galoisMeanSlopeAt_eq_zero_iff (p : ℕ) [Fact p.Prime] :
    galoisMeanSlopeAt F p = 0 ↔ ¬ (p : ℤ) ∣ NumberField.discr F := by
  sorry

/-- `README.md`, Layer 7, 7.1. `galoisRootDiscriminant ℚ = 1`. -/
theorem galoisRootDiscriminant_rat : galoisRootDiscriminant ℚ = 1 := by
  sorry

end GaloisRootDiscriminant

end

end TauCetiRoadmap.PadicExtensionFamilies
