module

import Mathlib
import TauCeti.NumberTheory.LocalField.Herbrand.Jump
import TauCeti.NumberTheory.LocalField.Discriminant.Basic
import TauCeti.NumberTheory.LocalField.Eisenstein.PowerBasis
import TauCeti.NumberTheory.LocalField.AbsoluteRamificationIndex
import TauCeti.NumberTheory.LocalField.Padic
import TauCeti.NumberTheory.LocalField.FiniteExtension.IntermediateField
import TauCeti.Analysis.Convex.Sequence.Envelope
import TauCeti.Analysis.Convex.Sequence.Face
import TauCeti.NumberTheory.NewtonPolygon.Slopes

/-!
# Ramification polygons, slopes and families of p-adic extensions: target signatures

The roadmap is README.md; this file is not the roadmap. It states the headline theorems
against the pinned Mathlib and Tau Ceti APIs: invariance of root differences, additivity of
wild residual polynomials on the faces of the ramification polygon, the discriminant integral,
the slope-polygon theorem, the polygon-to-break theorem, invariance of the indices of
inseparability, Miki's ordered decomposition, Ore's realizability theorem, Krasner's refined
count, Monge's class count, completeness of a finite totally ramified list by its mass,
and the Galois root-discriminant product formula. Polygons are Tau Ceti's
`Polynomial.newtonPolygon`, `Polynomial.newtonSlopes`, `TauCeti.lowerConvexEnvelope` and
`TauCeti.IsFiniteFace`, read with a real additive valuation of `L` normalized by `addValInt`.

The slope dictionary and the Galois slope content are statements about the Swan-slope multiset
of a separable extension: the upper breaks with their multiplicities. Its definition as a
multiset needs the finiteness of the set of breaks, which is itself a theorem; the pins have the
break predicate `UpperJump` but no finite carrier of breaks with multiplicities. The jump-set
classification lacks the filtered principal-unit module and its standard filtered presentation.
The generic-family polynomial and family-mass theorems lack the intrinsic Herbrand invariant
of a field, built on the same Swan-slope multiset, and the Eisenstein diagram. These remain
README targets, without substitute predicates or arithmetic-only theorems here.

Counting uses finite intermediate fields of SeparableClosure K with the pinned spectral-norm
adapters; representatives are selected by actual K-algebra equivalences. The arithmetic
formulas occur only as the right sides of counts of these fields or their classes.
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


/-! ## Layer 1: the ramification polynomial and residual polynomials -/

variable {K L} in
/-- `README.md`, Layer 1, 1.1. The ramification polynomial `ρ(x) = α^{-n} φ(α x + α)` of a
polynomial `φ` over `𝒪[K]` and an element `α : L`, with `n = natDegree φ`. For `φ` monic Eisenstein
with root `α`, `ρ` is monic of degree `n`, `ρ(0) = 0`, and its roots are `(α' − α)/α` over the
conjugates `α'` of `α`. -/
def ramificationPolynomial (φ : 𝒪[K][X]) (α : L) : L[X] :=
  C (α⁻¹ ^ φ.natDegree) *
    (φ.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).comp (C α * X + C α)

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
  [ValuativeExtension K M] [Module.Finite K L]

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
same multiset of root-difference valuations for a totally ramified extension. -/
theorem conjugateBreaks_eq_of_irreducible [ValuativeExtension L M] (h : IsTotallyRamified K L)
    [Module.Finite K M] [IsGalois K M] {ξ ξ' : 𝒪[L]} (hξ : Irreducible ξ)
    (hξ' : Irreducible ξ') :
    conjugateBreaks K L M (ξ : L) = conjugateBreaks K L M (ξ' : L) := by
  sorry

/-- `README.md`, Layer 1, 1.2. For `L/K` totally ramified and `ξ` a uniformizer, every
root-difference valuation is nonnegative, and exactly `n − p^w` of them vanish (the tame
segment). -/
theorem card_filter_conjugateBreaks_eq_zero [ValuativeExtension L M] [Module.Finite K M] [IsGalois K M] (h : IsTotallyRamified K L) {ξ : 𝒪[L]}
    (hξ : Irreducible ξ) :
    ((conjugateBreaks K L M (ξ : L)).filter (· = 0)).card =
      Module.finrank K L - ringChar 𝓀[K] ^ wildExponent K L := by
  sorry

end Closure

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
/-- `README.md`, Layer 1, 1.3. Let `[k, k + l]`, `l > 0`, be the face of slope `−h/m` of the
ramification polygon (Convention 4: Tau Ceti's `Polynomial.newtonPolygon` of `ρ` for the
normalized valuation `v` of `L`), with `h/m > 0` in lowest terms, so that `h/m` is a ram. Then
`x^k A(x^m)` is an additive polynomial over `𝓀[L]`: the nonzero coefficients of the residual
polynomial `A` of that face sit at exponents `j` with `k + j m` a power of `p`. -/
theorem residualPolynomial_additive {φ : 𝒪[K][X]} (hmonic : φ.Monic) (hφ : φ.IsEisensteinAt 𝓂[K]) {α : L}
    (hroot : (φ.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).IsRoot α)
    (hgen : K⟮α⟯ = ⊤) (v : AddValuation L (WithTop ℝ))
    (hv : ∀ x : L, x ≠ 0 → v x = ((addValInt L x : ℝ) : WithTop ℝ)) {k l h m : ℕ} (hl : 0 < l)
    (hh : 0 < h) (hm : 0 < m) (hcop : h.Coprime m)
    (hface : IsFiniteFace ((ramificationPolynomial φ α).newtonPolygon v) (-(h : ℝ) / m) k (k + l))
    {j : ℕ} (hj : (residualPolynomial φ α k l h m).coeff j ≠ 0) :
    ∃ i : ℕ, k + j * m = ringChar 𝓀[K] ^ i := by
  sorry


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


/-- `README.md`, Layer 2, 2.3. **The discriminant exponent as an upper-numbering integral.**
`c(L/K) = ∫_{-1}^{∞} ([L : K] − [G : G^u H]) du`, Serre's `IV §1, Prop. 4` through Herbrand's
change of variables. The integrand is read at `max u (−1)` so that it is defined on all of `ℝ`;
it vanishes for sufficiently large `u`. -/
theorem discriminantExponent_eq_integral [Algebra.IsSeparable K L] :
    (discriminantExponent K L : ℝ) =
      ∫ u in Set.Ioi (-1 : ℝ),
        ((Module.finrank K L : ℝ) -
          embeddingOrbitCount K L M ⟨max u (-1), le_max_right u (-1)⟩) := by
  sorry

/-- `README.md`, Layer 2, 2.4. The **slope polygon** of a finite separable `L/K`: Tau Ceti's
lower convex envelope of the points `(n_E, c(E/K))` over the intermediate fields `E` of `L/K`,
`n_E = [E : K]`, each `E` with its canonical local-field structure. The height at abscissa `n` is
the least discriminant exponent of a subextension of degree `n`, or `⊤` when there is none. -/
def slopePolygon [Module.Finite K L] [Algebra.IsSeparable K L] : ℕ → WithTop ℝ :=
  lowerConvexEnvelope fun n =>
    ⨅ (E : IntermediateField K L) (_ : Module.finrank K E = n),
      haveI := Algebra.isSeparable_tower_bot_of_isSeparable K E L
      letI := finiteIntermediateFieldValuativeRel K L E
      letI := finiteIntermediateFieldTopology K L E
      letI := finiteIntermediateField_isNonarchimedeanLocalField K L E
      letI := finiteIntermediateField_valuativeExtension K L E
      (((discriminantExponent K E : ℕ) : ℝ) : WithTop ℝ)

/-- `README.md`, Layer 2, 2.4. **The slope-polygon theorem.** If the orbit count
`[G : G^v H]` is constant for `v ∈ (u, u']`, then the slope polygon of `L/K` is affine of slope
`u + 1` on the abscissae from `[G : G^u H]` to `[G : G^{u'} H]`, the degrees of the fixed fields
of `G^u H` and `G^{u'} H`. The orbit count is nondecreasing, so only `u ≤ u'` has content. Taking for `u` the upper breaks of `L/K` in turn, its segments have
slope `0` on `[1, f]`, slope `1` on `[f, f ε]`, and the Artin slopes `u + 1`, `u > 0`, beyond:
the LMFDB's visible slopes are Deligne's (Deligne, Appendix A.6; Serre IV §1, Prop. 4). -/
theorem slopePolygon_eq_of_embeddingOrbitCount_eq [Module.Finite K L]
    [Algebra.IsSeparable K L] {u u' : RamificationIndexDomain}
    (hconst : ∀ v : RamificationIndexDomain, u < v → v ≤ u' →
      embeddingOrbitCount K L M v = embeddingOrbitCount K L M u')
    (n : ℕ) (hn : embeddingOrbitCount K L M u ≤ n) (hn' : n ≤ embeddingOrbitCount K L M u') :
    slopePolygon K L n =
      slopePolygon K L (embeddingOrbitCount K L M u) +
        ((((u : ℝ) + 1) * ((n : ℝ) - embeddingOrbitCount K L M u) : ℝ) : WithTop ℝ) := by
  sorry

/-- `README.md`, Layer 2, 2.5, with Layer 1, 1.2. **The polygon-to-break theorem.** Let `φ` be
a monic Eisenstein polynomial over `𝒪[K]` with a root `α` generating `L`, and read the
ramification polygon with the normalized valuation `v` of `L`. For every `t ≥ −1`, one more
than the number of Newton slopes of `ρ` that are at most `−φ_{M/L}(t)` (the nonzero roots
`(σα − α)/α` of valuation at least `φ_{M/L}(t)`, the root `0` being the identity embedding) is
the size `[G_t : G_t ∩ H]` of the `G_t`-orbit of the identity embedding in `Hom_K(L, M)`, where
`G_t` is the lower filtration of `M/K` and `φ_{M/L}` is Tau Ceti's `herbrand L M`. Hence the rams
are the values `φ_{M/L}(t)` at the jumps of `G_t H` (Deligne, Appendix A.6, Prop. A.6.2;
Greve–Pauli, §8, when `M = L`). -/
theorem one_add_card_filter_newtonSlopes_eq_relIndex [ValuativeExtension L M]
    [Module.Finite L M] [IsGalois L M] {φ : 𝒪[K][X]} (hmonic : φ.Monic)
    (hφ : φ.IsEisensteinAt 𝓂[K]) {α : L}
    (hroot : (φ.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).IsRoot α)
    (hgen : K⟮α⟯ = ⊤) (v : AddValuation L (WithTop ℝ))
    (hv : ∀ x : L, x ≠ 0 → v x = ((addValInt L x : ℝ) : WithTop ℝ))
    (t : RamificationIndexDomain) :
    1 + (((ramificationPolynomial φ α).newtonSlopes v).filter
        fun s => s ≤ -((herbrand L M t : RamificationIndexDomain) : ℝ)).card =
      (embeddingSubgroup K L M).relIndex (lowerRamificationGroupReal K M t) := by
  sorry

end Breaks


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
theorem indexOfInseparability_eq_of_eisenstein {φ φ' : 𝒪[K][X]}
    (hmonic : φ.Monic) (hmonic' : φ'.Monic) (hφ : φ.IsEisensteinAt 𝓂[K])
    (hφ' : φ'.IsEisensteinAt 𝓂[K]) {α α' : L}
    (hα : (φ.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).IsRoot α)
    (hα' : (φ'.map ((algebraMap K L).comp (algebraMap 𝒪[K] K))).IsRoot α')
    (hgen : K⟮α⟯ = ⊤) (hgen' : K⟮α'⟯ = ⊤) (j : ℕ) :
    indexOfInseparability (L := L) φ j = indexOfInseparability (L := L) φ' j := by
  sorry


/-- An ordered Miki decomposition of a principal unit `a`, of depth `r`: principal-unit
factors with `a = ∏ α_i^(p^(r-i))`, each nontrivial level prime to `p` below `pe/(p-1)`,
or at that endpoint and not a p-th power; the weighted nontrivial levels strictly increase.
The value of `addValInt` at zero is never used as the level of a nontrivial factor. -/
structure MikiDecomposition (p : ℕ) [Fact p.Prime] [FinitePadicExtension K p]
    (a : K) (r : ℕ) where
  /-- The factors in ascending order of weighted level. -/
  factor : Fin (r + 1) → Kˣ
  /-- The product giving the decomposed principal unit. -/
  prod_eq : ∏ i, (factor i : K) ^ p ^ (r - i.1) = a
  /-- Nontrivial factors are principal units with the prescribed reduced level. -/
  level : ∀ i, factor i = 1 ∨
    (0 < addValInt K ((factor i : K) - 1) ∧
      ((((p - 1 : ℕ) : ℤ) * addValInt K ((factor i : K) - 1) <
          p * absoluteRamificationIndex K p ∧
        ¬ (p : ℤ) ∣ addValInt K ((factor i : K) - 1)) ∨
       (((p - 1 : ℕ) : ℤ) * addValInt K ((factor i : K) - 1) =
          p * absoluteRamificationIndex K p ∧ ∀ y : K, y ^ p ≠ (factor i : K))))
  /-- This excludes cancelling insertions of p-th powers at out-of-order levels. -/
  ordered : ∀ i j, i < j → factor i ≠ 1 → factor j ≠ 1 →
    (p : ℤ) ^ (r - i.1) * addValInt K ((factor i : K) - 1) <
      (p : ℤ) ^ (r - j.1) * addValInt K ((factor j : K) - 1)

/-- Miki, Lemma 17, pp.111–112: a principal unit below the top level has an ordered
reduced decomposition of depth `v_p(v_K(a-1))`; for a non-p-th-power the factor levels,
including trivial factors, are independent of the decomposition. -/
theorem miki_decomposition_exists_unique_levels (p : ℕ) [Fact p.Prime]
    [FinitePadicExtension K p] (a : K) (ha : a ≠ 1)
    (hpos : 0 < addValInt K (a - 1))
    (hbound : ((p - 1 : ℕ) : ℤ) * addValInt K (a - 1) < p * absoluteRamificationIndex K p) :
    let r := padicValNat p (addValInt K (a - 1)).toNat
    Nonempty (MikiDecomposition K p a r) ∧
      ((∀ y : K, y ^ p ≠ a) → ∀ D D' : MikiDecomposition K p a r,
        ∀ i, (D.factor i = 1 ↔ D'.factor i = 1) ∧
          (D.factor i ≠ 1 → addValInt K ((D.factor i : K) - 1) =
            addValInt K ((D'.factor i : K) - 1))) := by
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

/-- A finite separable subextension with prescribed ramification index, residue degree
and discriminant exponent, using the canonical local-field structures at the pin. -/
def HasExtensionInvariants (E : IntermediateField K (SeparableClosure K))
    (e f c : ℕ) : Prop :=
  ∃ h : Module.Finite K E,
    letI := h
    letI := finiteIntermediateFieldValuativeRel K (SeparableClosure K) E
    letI := finiteIntermediateFieldTopology K (SeparableClosure K) E
    letI := finiteIntermediateField_isNonarchimedeanLocalField K (SeparableClosure K) E
    letI := finiteIntermediateField_valuativeExtension K (SeparableClosure K) E
    ramificationIndex K E = e ∧ inertiaDegree K E = f ∧ discriminantExponent K E = c

/-- Ore's realizability criterion for separable totally ramified extensions, in either
characteristic. The degree is positive; `j` is the wild discriminant exponent. -/
theorem ore_realizability (n j : ℕ) (hn : 0 < n) :
    (∃ E : IntermediateField K (SeparableClosure K), HasExtensionInvariants K E n 1 (n - 1 + j)) ↔
      IsOreAdmissible K n j := by
  sorry

/-- The coefficient lower bound of the discriminant box at index `h`, for positive degree.
A coefficient with `h = 0` in the base field contributes no derivative constraint. -/
def oreCoefficientDepth (n j h : ℕ) : ℕ := by
  classical
  exact if hh : (h : K) = 0 then 1 else
    max 1 (j / n + 1 + (if h < j % n then 1 else 0) - natCastValuation K h hh)

/-- Krasner's refined count, obtained by evaluating the normalized box volume; it is zero
outside Ore's admissible discriminants. Integer powers retain negative exponents faithfully. -/
def krasnerCount (n j : ℕ) : ℚ := by
  classical
  let q : ℚ := Nat.card 𝓀[K]
  exact if IsOreAdmissible K n j then
    n * q ^ (((n + j - 1 : ℕ) : ℤ) -
      ((∑ h ∈ Finset.Ico 1 n, oreCoefficientDepth K n j h : ℕ) : ℤ)) *
        (if j % n = 0 then 1 else 1 - q⁻¹)
  else 0

/-- Krasner's discriminant-refined theorem counts actual subfields, and asserts finiteness
of each stratum, including in equal characteristic. The case `n = 0` is excluded. -/
theorem krasner_refined_count (n j : ℕ) (hn : 0 < n) :
    Set.Finite {E : IntermediateField K (SeparableClosure K) |
      HasExtensionInvariants K E n 1 (n - 1 + j)} ∧
    (Nat.card {E : IntermediateField K (SeparableClosure K) //
      HasExtensionInvariants K E n 1 (n - 1 + j)} : ℚ) = krasnerCount K n j := by
  sorry

/-! ## Layer 6: counting isomorphism classes -/

/-- Representatives of extensions with prescribed positive ramification index and inertia
 degree. Every member has the required invariants and every such field is isomorphic to
 exactly one member; an empty or duplicate list cannot satisfy this predicate. -/
def IsInertiaRepresentativeSet (e f : ℕ)
    (R : Set (IntermediateField K (SeparableClosure K))) : Prop :=
  (∀ E ∈ R, ∃ c, HasExtensionInvariants K E e f c) ∧
    ∀ E : IntermediateField K (SeparableClosure K),
      (∃ c, HasExtensionInvariants K E e f c) →
        ∃! F : IntermediateField K (SeparableClosure K), F ∈ R ∧ Nonempty (E ≃ₐ[K] F)

/-- The ramification index and residue degree of the splitting field of `X^(p^i)-1`
over `K`. In characteristic zero this is `K(ζ_(p^i))`, including `K` at `i = 0`. -/
def cyclotomicInvariants (p i : ℕ) : ℕ × ℕ :=
  let M := (X ^ (p ^ i) - 1 : K[X]).SplittingField
  letI := algebraicExtensionValuativeRel K M
  letI := algebraicExtensionNormedFieldTopology K M
  letI := finiteExtension_isNonarchimedeanLocalField K M
  letI := algebraicExtension_valuativeExtension K M
  (ramificationIndex K M, inertiaDegree K M)

/-- The sum in Monge's formula (6): its arguments in the count satisfy `p^s ∣ N`,
so each integer quotient in the exponent is exact. -/
def mongeSigma (p N s : ℕ) : ℚ :=
  1 + ∑ i ∈ Finset.range s, (p : ℚ) ^ (i + 1) *
    ((p : ℚ) ^ (∑ j ∈ Finset.range (i + 1), N / p ^ (j + 1)) -
      (p : ℚ) ^ (∑ j ∈ Finset.range i, N / p ^ (j + 1)))

/-- The successive cyclotomic correction in Monge's formula (7). -/
def mongeDelta (p m s i : ℕ) : ℚ :=
  if s = 0 ∧ i = 0 then 1
  else if 0 < s ∧ i = 0 then ((p : ℚ) ^ m - 1) * (p : ℚ) ^ (m * (s - 1))
  else if i < s ∧ 0 < i then ((p : ℚ) - 1) * ((p : ℚ) ^ m - 1) *
    (p : ℚ) ^ (m * (s - 1) + i - 1)
  else if s = i ∧ 0 < i then ((p : ℚ) - 1) * (p : ℚ) ^ (m * s + s - 1)
  else 0

/-- Monge's Theorem 1 for a finite extension `K/ℚ_p`: both cyclotomic ramification and
inertia are read from actual extensions of `K`, not supplied as free numerical functions. -/
def mongeCount (p : ℕ) [Fact p.Prime] [FinitePadicExtension K p] (e f : ℕ) : ℚ :=
  let n0 := Module.finrank ℚ_[p] K
  let f0 := inertiaDegree ℚ_[p] K
  (1 / (f : ℚ)) * ∑ i ∈ Finset.range (padicValNat p e + 1),
    ∑ fp ∈ f.divisors, ∑ ep ∈ e.divisors,
      let ei := (cyclotomicInvariants K p i).1
      let fi := (cyclotomicInvariants K p i).2
      let epp := e / (ei * ep)
      let fpp := f / (fi * fp)
      let spp := padicValNat p epp
      let hpp := epp / p ^ spp
      let N := n0 * ei * fi * ep * fp
      if ei * ep ∣ e ∧ fi * fp ∣ f ∧ hpp ∣ p ^ (f0 * fi * fp) - 1 then
        (Nat.totient hpp : ℚ) * Nat.totient fpp / ei *
          mongeSigma p N (padicValNat p ep) * mongeDelta p N spp i
      else 0

/-- Monge's class-count theorem, with existence of a finite representative set and the
same cardinality for every representative set. It applies to every finite base `K/ℚ_p`. -/
theorem monge_class_count (p : ℕ) [Fact p.Prime] [FinitePadicExtension K p]
    (e f : ℕ) (he : 0 < e) (hf : 0 < f) :
    (∃ R : Set (IntermediateField K (SeparableClosure K)),
      R.Finite ∧ IsInertiaRepresentativeSet K e f R) ∧
    ∀ R : Set (IntermediateField K (SeparableClosure K)),
      IsInertiaRepresentativeSet K e f R →
        R.Finite ∧ (Nat.card R : ℚ) = mongeCount K p e f := by
  sorry

/-- The wild discriminant height of a finite intermediate field, using the canonical
local-field structures, with value zero for an infinite extension. For a totally ramified
extension this is `discriminantExponent K E + 1 - [E : K]`, the mass-formula weight. -/
def totallyRamifiedHeight (E : IntermediateField K (SeparableClosure K)) : ℕ := by
  classical
  exact if h : Module.Finite K E then
    letI := h
    letI := finiteIntermediateFieldValuativeRel K (SeparableClosure K) E
    letI := finiteIntermediateFieldTopology K (SeparableClosure K) E
    letI := finiteIntermediateField_isNonarchimedeanLocalField K (SeparableClosure K) E
    letI := finiteIntermediateField_valuativeExtension K (SeparableClosure K) E
    discriminantExponent K E + 1 - Module.finrank K E
  else 0

/-- A finite set of pairwise nonisomorphic separable totally ramified extensions of positive
 degree is complete if and only if its Serre mass is one. This holds for every nonarchimedean
 local base field, including equal characteristic; README §6.8. -/
theorem mass_completeness (n : ℕ) (hn : 0 < n)
    (S : Finset (IntermediateField K (SeparableClosure K)))
    (hmem : ∀ E ∈ S, ∃ c, HasExtensionInvariants K E n 1 c)
    (hpair : ∀ E ∈ S, ∀ F ∈ S, Nonempty (E ≃ₐ[K] F) → E = F) :
    (∀ E : IntermediateField K (SeparableClosure K),
      (∃ c, HasExtensionInvariants K E n 1 c) →
        ∃ F ∈ S, Nonempty (E ≃ₐ[K] F)) ↔
      (∑ E ∈ S, (1 : ℚ) /
        ((Nat.card (E ≃ₐ[K] E) : ℚ) *
          (Nat.card 𝓀[K] : ℚ) ^ totallyRamifiedHeight K E)) = 1 := by
  sorry

/-! ## Layer 7: the Galois root discriminant -/

section GaloisRootDiscriminant

variable (F : Type*) [Field F] [NumberField F]

/-- `README.md`, Layer 7. The Galois closure of a number field inside an algebraic closure. -/
abbrev galoisClosure : IntermediateField ℚ (AlgebraicClosure F) :=
  IntermediateField.normalClosure ℚ F (AlgebraicClosure F)

/-- The normal closure is a number field by finiteness of the normal closure. -/
instance instNumberFieldGaloisClosure : NumberField (galoisClosure F) where
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


end GaloisRootDiscriminant

end

end TauCetiRoadmap.PadicExtensionFamilies
