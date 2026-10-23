import Mathlib
import TauCeti.NumberTheory.NumberField.TotallyPositive
import TauCeti.LowDimTopology.Plumbing.IntersectionForm
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Basic

/-!
# Hilbert modular surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The file states only what can be stated over Mathlib and the pinned Tau Ceti: the
Hirzebruch–Jung continued fractions (2.1–2.2), the cusp datum `G(M, V)` with its period and
resolution cycle (2.3–2.7), the rotation types with their strings and local Chern cycles (3.9),
Siegel's value of `ζ_F(−1)` (4.2), the intrinsic prefix `HMSPrefix F` with the index factors of
the volume (0.1, 0.3, 7.1), and the two Kodaira sets (5.2). The other targets, with their
definitions and Checks, are specified in `README.md` only: the cusps of a surface and their data
(1.4–1.5, 2.6), the elliptic-point record (3.11), the volume (4.3), the Chern numbers, `χ`, the
Hodge numbers and the resolution lengths of a surface (4.4–4.9), all of which need the congruence
subgroups and the quotient `Γ\ℍ²` of sibling roadmaps (README 0.3–0.4). `sorry` is permitted in
proofs in this human-owned repository: these are targets, not implementations.

Every invariant is a function of the data together with the **ordered pair of real embeddings**
`v₁ v₂ : F →+* ℝ` (`README.md`, *Pinned conventions*, 1). Conventions visible in the signatures:
the Hirzebruch–Jung (minus) continued fraction with all entries `≥ 2` (`hjExpansion`,
convention 6); a resolution cycle recorded as the list of self-intersection numbers
`(−b₁, …, −b_d)` repeated `k = [U_M^+ : V]` times (convention 7); a rotation type `(q; 1, r)`
with `gcd(r, q) = 1` and `r < q`, *not* identified with its swap `(q; 1, r⁻¹)` (convention 9);
the local Chern cycle through the lattice points `P_i` of convention 13; Siegel's value as the
finite sum `siegelZetaMinusOne` (convention 12, 4.2); the two Kodaira sets of convention 11,
`kodairaPossibilitiesMinimal` for a known minimal model and `kodairaDims` for a lower bound on
`K²`; and a period recorded as a list but compared as a `Cycle`, since the starting point of a
resolution cycle is a labelling convention (README 2.3).

The exceptions to "every proof is `sorry`" are the `decide` checks of the tables of conventions 6,
12 and 13 and of the worked examples (`hjExpansion`, `localChernSelfIntersection`,
`siegelZetaMinusOne`, `kodairaDims`), the group structure of `multiplierUnits`, and the
non-vacuity constructor `levelOneCusp` for `CuspDatum`.
-/

namespace TauCetiRoadmap.HilbertModularSurfaces

open NumberField

/-! ## Layer 2.1: the minus continued fraction of a rational -/

/-- Fuel-indexed Hirzebruch–Jung expansion: `n/r = b − r'/r` with `b = ⌈n/r⌉` and
`r' = b r − n`, then recurse on `r/r'`. The fuel bounds the recursion so that `decide` evaluates
it (`README.md`, Layer 2, 2.1). -/
def hjExpansionAux : ℕ → ℕ → ℕ → List ℕ
  | 0, _, _ => []
  | fuel + 1, n, r =>
    if r = 0 then [] else ((n + r - 1) / r) :: hjExpansionAux fuel r ((n + r - 1) / r * r - n)

/-- The Hirzebruch–Jung continued fraction `n/r = [[b₁, …, b_ℓ]]` of convention 6 for
`0 < r < n`; it is `[]` when `r = 0` or `r ≥ n`, and for `gcd(n, r) = g > 1` it is the expansion
of `(n/g)/(r/g)` (`README.md`, Layer 2, 2.1). -/
def hjExpansion (n r : ℕ) : List ℕ := if r < n then hjExpansionAux n n r else []

/-- The length `ℓ` of the string `[[b₁, …, b_ℓ]]` (`README.md`, Layer 2, 2.1). -/
def hjLength (n r : ℕ) : ℕ := (hjExpansion n r).length

example : hjExpansion 3 1 = [3] := by decide
example : hjExpansion 3 2 = [2, 2] := by decide
example : hjExpansion 5 2 = [3, 2] := by decide
example : hjExpansion 5 3 = [2, 3] := by decide
example : hjExpansion 6 5 = [2, 2, 2, 2, 2] := by decide
example : hjExpansion 12 5 = [3, 2, 3] := by decide
example : hjExpansion 12 7 = [2, 4, 2] := by decide
example : hjExpansion 2 5 = [] := by decide
example : hjExpansion 4 2 = hjExpansion 2 1 := by decide

/-- Every entry of a Hirzebruch–Jung expansion is at least `2` (`README.md`, Layer 2, 2.1). -/
theorem two_le_of_mem_hjExpansion {n r b : ℕ} (hr : 0 < r) (hrn : r < n)
    (hb : b ∈ hjExpansion n r) : 2 ≤ b := sorry

/-- Inverting `r` modulo `n` reverses the expansion: `hjExpansion n r' = reverse (hjExpansion n r)`
for `r r' ≡ 1 mod n` (`README.md`, Layer 2, 2.1). -/
theorem hjExpansion_reverse {n r r' : ℕ} (hr : 0 < r) (hrn : r < n) (hr' : r' < n)
    (h : r * r' % n = 1) : hjExpansion n r' = (hjExpansion n r).reverse := sorry

/-! ## Convention 9 and Layer 3.9: rotation types and Hirzebruch–Jung strings -/

/-- A rotation type `(q; 1, r)` of convention 9: the cyclic quotient singularity
`ℂ²/⟨(ζ_q, ζ_q^r)⟩` with `gcd(r, q) = 1`. Types are *not* identified under `r ↦ r⁻¹ mod q`
(`README.md`, *Pinned conventions*, 9). -/
structure RotationType where
  /-- The order `q ≥ 2` of the stabilizer. -/
  q : ℕ
  /-- The exponent `r` of the second eigenvalue, normalised so that the first is `ζ_q`. -/
  r : ℕ
  two_le : 2 ≤ q
  r_lt : r < q
  coprime : Nat.Coprime r q
  deriving DecidableEq

namespace RotationType

/-- The Hirzebruch–Jung string `[[b₁, …, b_ℓ]]` of `q/r` (`README.md`, Layer 3, 3.9). -/
def hjString (t : RotationType) : List ℕ := hjExpansion t.q t.r

/-- `ℓ(q; 1, r)`, the number of curves in the minimal resolution (`README.md`, Layer 3, 3.9). -/
def resolutionLength (t : RotationType) : ℕ := t.hjString.length

/-- The lattice points `P₀ = (1, 0)`, `P₁ = (r/q, 1/q)`, `P_{i+1} = b_i P_i − P_{i−1}` of
convention 13, returned as the coefficients `x_i + y_i − 1` of `P₁, …, P_ℓ` on the curves
`C₁, …, C_ℓ` (`README.md`, *Pinned conventions*, 13). -/
def chernCoefficients (q r : ℕ) : List ℚ :=
  go (hjExpansion q r) (1, 0) ((r : ℚ) / q, 1 / (q : ℚ))
where
  go : List ℕ → ℚ × ℚ → ℚ × ℚ → List ℚ
    | [], _, _ => []
    | b :: bs, P₀, P₁ => (P₁.1 + P₁.2 - 1) :: go bs P₁ ((b : ℚ) • P₁ - P₀)

/-- The self-intersection `Σ zᵢ² (−bᵢ) + 2 Σ zᵢ zᵢ₊₁` of the cycle `Σ zᵢ Cᵢ` on a chain with
`Cᵢ² = −bᵢ`, `Cᵢ·Cᵢ₊₁ = 1` (`README.md`, *Pinned conventions*, 13). -/
def chainSelfIntersection (bs : List ℕ) (z : List ℚ) : ℚ :=
  -(List.zipWith (fun (b : ℕ) (zi : ℚ) => (b : ℚ) * zi ^ 2) bs z).sum +
    2 * (List.zipWith (· * ·) z z.tail).sum

/-- `c(q; 1, r) = Z·Z`, the self-intersection of the local Chern cycle of convention 13
(`README.md`, Layer 3, 3.9). -/
def localChernSelfIntersection (t : RotationType) : ℚ :=
  chainSelfIntersection t.hjString (chernCoefficients t.q t.r)

/-- The contribution `ℓ(q; 1, r) + (q − 1)/q` of one point of this type to `c₂`
(`README.md`, Layer 4, 4.4). -/
def eulerContribution (t : RotationType) : ℚ :=
  t.resolutionLength + ((t.q : ℚ) - 1) / t.q

/-- `(q; 1, r)` and `(q; 1, r')` with `r r' ≡ 1 mod q` are the same singularity with the two
tangent directions swapped (`README.md`, Layer 3, 3.9; *Worked examples*, boundary checks). -/
def IsSwap (t t' : RotationType) : Prop := t.q = t'.q ∧ t.r * t'.r % t.q = 1

instance : DecidableRel IsSwap := fun _ _ => inferInstanceAs (Decidable (_ ∧ _))

/-- Swapped types have equal local Chern self-intersection (`README.md`, Layer 3, 3.9). -/
theorem localChernSelfIntersection_eq_of_isSwap {t t' : RotationType} (h : IsSwap t t') :
    t.localChernSelfIntersection = t'.localChernSelfIntersection := sorry

/-- Swapped types have resolutions of the same length (`README.md`, Layer 3, 3.9). -/
theorem resolutionLength_eq_of_isSwap {t t' : RotationType} (h : IsSwap t t') :
    t.resolutionLength = t'.resolutionLength := sorry

/-- The type `(q; 1, q − 1)` is the `A_{q−1}` singularity: `c = 0`, `ℓ = q − 1`
(`README.md`, Layer 3, 3.9). -/
theorem localChernSelfIntersection_eq_zero_of_r_eq_pred (t : RotationType) (h : t.r = t.q - 1) :
    t.localChernSelfIntersection = 0 ∧ t.resolutionLength = t.q - 1 := sorry

/-- The thirteen types occurring on the surfaces of the LMFDB (`README.md`, Layer 3, 3.3, 3.7). -/
def ofNums (q r : ℕ) (h₁ : 2 ≤ q := by decide) (h₂ : r < q := by decide)
    (h₃ : Nat.Coprime r q := by decide) : RotationType := ⟨q, r, h₁, h₂, h₃⟩

/-- The table of convention 13 (`README.md`, *Pinned conventions*, 13). -/
example : (ofNums 2 1).localChernSelfIntersection = 0 ∧ (ofNums 2 1).resolutionLength = 1 := by
  decide +kernel
example : (ofNums 3 1).localChernSelfIntersection = -1/3 ∧ (ofNums 3 1).resolutionLength = 1 := by
  decide +kernel
example : (ofNums 3 2).localChernSelfIntersection = 0 ∧ (ofNums 3 2).resolutionLength = 2 := by
  decide +kernel
example : (ofNums 4 1).localChernSelfIntersection = -1 ∧ (ofNums 4 1).resolutionLength = 1 := by
  decide +kernel
example : (ofNums 4 3).localChernSelfIntersection = 0 ∧ (ofNums 4 3).resolutionLength = 3 := by
  decide +kernel
example : (ofNums 5 1).localChernSelfIntersection = -9/5 := by decide +kernel
example : (ofNums 5 2).localChernSelfIntersection = -2/5 ∧ (ofNums 5 2).resolutionLength = 2 := by
  decide +kernel
example : (ofNums 5 3).localChernSelfIntersection = -2/5 ∧ (ofNums 5 3).resolutionLength = 2 := by
  decide +kernel
example : (ofNums 5 4).localChernSelfIntersection = 0 ∧ (ofNums 5 4).resolutionLength = 4 := by
  decide +kernel
example : (ofNums 6 1).localChernSelfIntersection = -8/3 ∧ (ofNums 6 1).resolutionLength = 1 := by
  decide +kernel
example : (ofNums 6 5).localChernSelfIntersection = 0 ∧ (ofNums 6 5).resolutionLength = 5 := by
  decide +kernel
example : (ofNums 12 5).localChernSelfIntersection = -1 ∧ (ofNums 12 5).resolutionLength = 3 := by
  decide +kernel
example : (ofNums 12 7).localChernSelfIntersection = -4/3 ∧
    (ofNums 12 7).resolutionLength = 3 := by decide +kernel

/-- `(5; 1, 2)` and `(5; 1, 3)` are swaps of each other, `(5; 1, 2)` is not its own swap, and
`(12; 1, 5)`, `(12; 1, 7)` are each self-swapped and distinct (`README.md`, *Worked examples*,
boundary checks). -/
example : IsSwap (ofNums 5 2) (ofNums 5 3) ∧ ¬ IsSwap (ofNums 5 2) (ofNums 5 2) ∧
    IsSwap (ofNums 12 5) (ofNums 12 5) ∧ IsSwap (ofNums 12 7) (ofNums 12 7) ∧
    ofNums 12 5 ≠ ofNums 12 7 := by decide +kernel

end RotationType

/-- The path graph on `Fin n`: `i` is adjacent to `i + 1` (`README.md`, Layer 3, 3.9). -/
def stringGraph (n : ℕ) : SimpleGraph (Fin n) where
  Adj i j := (i : ℕ) + 1 = j ∨ (j : ℕ) + 1 = i
  symm := ⟨fun _ _ h => Or.symm h⟩
  loopless := ⟨fun i h => by rcases h with h | h <;> omega⟩

instance stringGraph.decidableRel (n : ℕ) : DecidableRel (stringGraph n).Adj :=
  fun i j => inferInstanceAs (Decidable ((i : ℕ) + 1 = j ∨ (j : ℕ) + 1 = i))

/-- The Hirzebruch–Jung string as a plumbing graph: the path on `Fin ℓ` with weights `−bᵢ`
(`README.md`, Layer 3, 3.9). -/
def stringPlumbing (bs : List ℕ) : TauCeti.PlumbingGraph (Fin bs.length) where
  toSimpleGraph := stringGraph bs.length
  decidableAdj := stringGraph.decidableRel bs.length
  weight := fun i => -(bs.get i : ℤ)

/-- The Hirzebruch–Jung string of a rotation type is negative definite
(`README.md`, Layer 3, 3.9). -/
theorem stringPlumbing_isNegativeDefinite (t : RotationType) :
    (stringPlumbing t.hjString).IsNegativeDefinite := sorry

/-! ## Layer 2.2–2.3: quadratic irrationals and cusp data -/

section Field

variable {F : Type*} [Field F] [NumberField F]

/-- The Hirzebruch–Jung stream `w₀ = w`, `w_{j+1} = 1/(⌈v₁ w_j⌉ − w_j)` of convention 6, computed
in `F` through the first real embedding `v₁` (`README.md`, Layer 2, 2.2). -/
noncomputable def hjStream (v₁ : F →+* ℝ) (w : F) : ℕ → F
  | 0 => w
  | j + 1 => ((⌈v₁ (hjStream v₁ w j)⌉ : F) - hjStream v₁ w j)⁻¹

/-- The digit `b_j = ⌈v₁ w_j⌉` (`README.md`, Layer 2, 2.2). -/
noncomputable def hjDigit (v₁ : F →+* ℝ) (w : F) (j : ℕ) : ℤ := ⌈v₁ (hjStream v₁ w j)⌉

/-- `w` is **reduced** for the ordered embeddings `(v₁, v₂)`: `v₁ w > 1` and `0 < v₂ w < 1`
(`README.md`, Layer 2, 2.2). -/
def IsReduced (v₁ v₂ : F →+* ℝ) (w : F) : Prop := 1 < v₁ w ∧ 0 < v₂ w ∧ v₂ w < 1

/-- A quadratic irrational of a real quadratic field has an eventually reduced stream
(`README.md`, Layer 2, 2.2). -/
theorem exists_isReduced_hjStream (v₁ v₂ : F →+* ℝ) (hv : v₁ ≠ v₂)
    (hF : Module.finrank ℚ F = 2) (w : F) (hw : w ∉ Set.range ((↑) : ℚ → F)) :
    ∃ j, IsReduced v₁ v₂ (hjStream v₁ w j) := sorry

/-- The successor of a reduced element is reduced (`README.md`, Layer 2, 2.2). -/
theorem isReduced_hjStream_one (v₁ v₂ : F →+* ℝ) (hv : v₁ ≠ v₂) (hF : Module.finrank ℚ F = 2)
    {w : F} (hw : IsReduced v₁ v₂ w) : IsReduced v₁ v₂ (hjStream v₁ w 1) := sorry

open Classical in
/-- The period `(b₁, …, b_d)` of a purely periodic stream: the digits of the shortest cycle,
`[]` when the stream never returns to `w` (`README.md`, Layer 2, 2.2). -/
noncomputable def hjPeriod (v₁ : F →+* ℝ) (w : F) : List ℤ :=
  if h : ∃ d, 0 < d ∧ hjStream v₁ w d = w then
    (List.range (Nat.find h)).map (hjDigit v₁ w) else []

/-- A reduced quadratic irrational is purely periodic, and the product of the period is the
fundamental totally positive unit of the multiplier ring of `ℤ + ℤ w` (`README.md`, Layer 2,
2.2). -/
theorem hjPeriod_ne_nil_of_isReduced (v₁ v₂ : F →+* ℝ) (hv : v₁ ≠ v₂)
    (hF : Module.finrank ℚ F = 2) {w : F} (hw : IsReduced v₁ v₂ w)
    (hirr : w ∉ Set.range ((↑) : ℚ → F)) :
    hjPeriod v₁ w ≠ [] ∧ IsTotallyPositive ((List.range (hjPeriod v₁ w).length).map
      (fun j => hjStream v₁ w (j + 1))).prod := sorry

/-- A basis `(x, y)` of a lattice is **oriented** when `v₁(x)v₂(y) − v₂(x)v₁(y) > 0`
(`README.md`, *Pinned conventions*, 5). -/
def IsOriented (v₁ v₂ : F →+* ℝ) (x y : F) : Prop := 0 < v₁ x * v₂ y - v₂ x * v₁ y

/-- The totally positive units of the multiplier ring of a `ℤ`-submodule `M ⊆ F`: the totally
positive `u ∈ Fˣ` with `uM = M` (`README.md`, *Pinned conventions*, 5 and 7, the group `U_M^+`). -/
def multiplierUnits (M : Submodule ℤ F) : Subgroup Fˣ where
  carrier := {u | IsTotallyPositive (u : F) ∧ ∀ m : F, m ∈ M ↔ (u : F) * m ∈ M}
  one_mem' := ⟨isTotallyPositive_one, fun m => by simp⟩
  mul_mem' := by
    rintro u v ⟨hu, hu'⟩ ⟨hv, hv'⟩
    refine ⟨hu.mul hv, fun m => ?_⟩
    rw [hv' m, hu' ((v : F) * m), Units.val_mul, mul_assoc]
  inv_mem' := by
    rintro u ⟨hu, hu'⟩
    refine ⟨by simpa using hu.inv, fun m => ?_⟩
    rw [hu' (((u⁻¹ : Fˣ) : F) * m), ← mul_assoc, Units.mul_inv, one_mul]

/-- A **cusp datum** `G(M, V)` of convention 5: an oriented rank-two `ℤ`-lattice `M ⊂ F` and a
subgroup `V` of finite index in the totally positive units of its multiplier ring
(`README.md`, Layer 2, 2.3). The orientation is supplied by the ordered embeddings, which every
function of a datum takes as arguments. -/
structure CuspDatum (F : Type*) [Field F] [NumberField F] where
  /-- The translation lattice `M`. -/
  M : Submodule ℤ F
  /-- `M` is finitely generated, so with `rank` a lattice (a `ℤ[1/2]`-span has finite rank too). -/
  fg : M.FG
  rank : Module.finrank ℤ M = 2
  /-- The multiplier group `V`. -/
  V : Subgroup Fˣ
  V_le : V ≤ multiplierUnits M
  V_relIndex_ne_zero : V.relIndex (multiplierUnits M) ≠ 0

namespace CuspDatum

variable (D : CuspDatum F)

/-- `k = [U_M^+ : V]`, the LMFDB's `repetition` (`README.md`, *Pinned conventions*, 7). -/
noncomputable def repetition : ℕ := D.V.relIndex (multiplierUnits D.M)

open Classical in
/-- The period `(b₁, …, b_d)` of `v₁(x/y)` for an oriented basis `(x, y)` of `M`, read off an
oriented basis whose quotient is reduced, where the expansion is purely periodic; such a basis
exists because the stream of any oriented basis is eventually reduced (2.2). The starting point is
a choice, so the period is compared only as a `Cycle` (`period_eq_hjPeriod`) (`README.md`,
Layer 2, 2.2–2.3). -/
noncomputable def period (v₁ v₂ : F →+* ℝ) (D : CuspDatum F) : List ℤ :=
  if h : ∃ x y : F, IsOriented v₁ v₂ x y ∧ Submodule.span ℤ {x, y} = D.M ∧ IsReduced v₁ v₂ (x / y)
  then hjPeriod v₁ (h.choose / h.choose_spec.choose) else []

/-- The period is read off any oriented basis with reduced quotient, as a cycle: two such bases
give rotations of one another (`README.md`, Layer 2, 2.2–2.3). -/
theorem period_eq_hjPeriod (v₁ v₂ : F →+* ℝ) {x y : F} (hor : IsOriented v₁ v₂ x y)
    (hspan : Submodule.span ℤ {x, y} = D.M) (hred : IsReduced v₁ v₂ (x / y)) :
    (D.period v₁ v₂ : Cycle ℤ) = (hjPeriod v₁ (x / y) : Cycle ℤ) := sorry

/-- The resolution cycle of convention 7: `(−b₁, …, −b_d)` repeated `k` times
(`README.md`, *Pinned conventions*, 7; Layer 2, 2.3). -/
noncomputable def resolutionCycle (v₁ v₂ : F →+* ℝ) : List ℤ :=
  (List.replicate D.repetition ((D.period v₁ v₂).map fun b => -b)).flatten

/-- `dk`, the number of curves over the cusp (`README.md`, Layer 2, 2.3). -/
noncomputable def cycleLength (v₁ v₂ : F →+* ℝ) : ℕ := (D.resolutionCycle v₁ v₂).length

/-- `Σ (2 − bᵢ)` over the cycle, the cusp's contribution to `K²` (`README.md`, Layer 2, 2.6). -/
noncomputable def cycleSum (v₁ v₂ : F →+* ℝ) : ℤ := ((D.resolutionCycle v₁ v₂).map (2 + ·)).sum

/-- The period is nonempty with all entries `≥ 2`, and not all entries are `2`
(`README.md`, Layer 2, 2.2, 2.5). -/
theorem period_spec (v₁ v₂ : F →+* ℝ) (hv : v₁ ≠ v₂) (hF : Module.finrank ℚ F = 2) :
    D.period v₁ v₂ ≠ [] ∧ (∀ b ∈ D.period v₁ v₂, 2 ≤ b) ∧ ∃ b ∈ D.period v₁ v₂, 3 ≤ b := sorry

/-- The intersection matrix of the cycle: the nodal curve `(2 + c₀)` for `dk = 1`, the double
edge `(c₀, 2; 2, c₁)` for `dk = 2`, the cycle graph for `dk ≥ 3` (`README.md`, Layer 2, 2.5). -/
def cycleIntersectionMatrix (c : List ℤ) : Matrix (Fin c.length) (Fin c.length) ℤ :=
  fun i j =>
    if c.length = 1 then c.get i + 2
    else if c.length = 2 then (if i = j then c.get i else 2)
    else if i = j then c.get i
    else if ((i : ℕ) + 1) % c.length = j ∨ ((j : ℕ) + 1) % c.length = i then 1 else 0

/-- The resolution cycle of a cusp datum is negative definite (`README.md`, Layer 2, 2.5). -/
theorem cycleIntersectionMatrix_negDef (v₁ v₂ : F →+* ℝ) (hv : v₁ ≠ v₂)
    (hF : Module.finrank ℚ F = 2) :
    (-(cycleIntersectionMatrix (D.resolutionCycle v₁ v₂))).PosDef := sorry

/-- Reversing the orientation (swapping `v₁`, `v₂`) gives the dual period: the two cycles satisfy
`Σ (bⱼ − 3) = −Σ (b'ⱼ − 3)` (`README.md`, Layer 2, 2.7). -/
theorem period_swap (v₁ v₂ : F →+* ℝ) (hv : v₁ ≠ v₂) (hF : Module.finrank ℚ F = 2) :
    ((D.period v₁ v₂).map fun b => b - 3).sum = -((D.period v₂ v₁).map fun b => b - 3).sum := sorry

end CuspDatum

/-- Non-vacuity: the level-one `Γ₀` cusp datum `G(R, R^×_{>0})` on the trivial component
(`README.md`, Layer 1, 1.5). -/
noncomputable def levelOneCusp (hF : Module.finrank ℚ F = 2) : CuspDatum F where
  M := Subalgebra.toSubmodule (integralClosure ℤ F)
  fg := by
    have : Module.Finite ℤ (integralClosure ℤ F) := inferInstanceAs (Module.Finite ℤ (𝓞 F))
    exact Module.Finite.iff_fg.mp
      (Module.Finite.equiv (Subalgebra.toSubmoduleEquiv (integralClosure ℤ F)).symm)
  rank := ((Subalgebra.toSubmoduleEquiv (integralClosure ℤ F)).finrank_eq.trans
    (RingOfIntegers.rank F)).trans hF
  V := multiplierUnits (Subalgebra.toSubmodule (integralClosure ℤ F))
  V_le := le_rfl
  V_relIndex_ne_zero := by rw [Subgroup.relIndex_self]; exact one_ne_zero

/-! ## Layer 4.2: Siegel's formula -/

open ArithmeticFunction in
/-- `(1/60) Σ_{b ∈ ℤ, b² < D, b ≡ D mod 2} σ₁((D − b²)/4)`, Siegel's closed form for `ζ_F(−1)`
(`README.md`, *Pinned conventions*, 12; Layer 4, 4.2). -/
def siegelZetaMinusOne (D : ℕ) : ℚ :=
  (1 / 60 : ℚ) * ∑ b ∈ (Finset.Icc (-(D : ℤ)) D).filter (fun b => b ^ 2 < (D : ℤ) ∧ b % 2 = D % 2),
    (sigma 1 (((D : ℤ) - b ^ 2) / 4).toNat : ℚ)

/-- The table of 4.2 (`README.md`, Layer 4, 4.2). -/
example : siegelZetaMinusOne 5 = 1/30 ∧ siegelZetaMinusOne 8 = 1/12 ∧
    siegelZetaMinusOne 12 = 1/6 ∧ siegelZetaMinusOne 13 = 1/6 ∧ siegelZetaMinusOne 17 = 1/3 ∧
    siegelZetaMinusOne 21 = 1/3 ∧ siegelZetaMinusOne 24 = 1/2 ∧ siegelZetaMinusOne 28 = 2/3 ∧
    siegelZetaMinusOne 29 = 1/2 ∧ siegelZetaMinusOne 33 = 1 ∧ siegelZetaMinusOne 37 = 5/6 ∧
    siegelZetaMinusOne 40 = 7/6 ∧ siegelZetaMinusOne 41 = 4/3 ∧ siegelZetaMinusOne 44 = 7/6 := by
  decide +kernel

/-- `60 ζ_F(−1)` is an integer and `ζ_F(−1) > 0` for a fundamental discriminant
(`README.md`, Layer 4, 4.2). -/
theorem siegelZetaMinusOne_spec (D : ℕ) (hD : Int.IsFundamentalDiscr (D : ℤ)) :
    0 < siegelZetaMinusOne D ∧ ∃ n : ℤ, 60 * siegelZetaMinusOne D = n := sorry

/-- Siegel's theorem: the meromorphic continuation of Mathlib's `dedekindZeta F` takes the value
`siegelZetaMinusOne |discr F|` at `−1`. The continuation is pinned by meromorphy on `ℂ` and
agreement with the Dirichlet series on `Re s > 1`, which determine it uniquely
(`README.md`, Layer 4, 4.2). -/
theorem dedekindZeta_neg_one_eq_siegel [IsTotallyReal F] (hF : Module.finrank ℚ F = 2)
    (ζ : ℂ → ℂ) (hζ : MeromorphicOn ζ Set.univ)
    (hagree : ∀ s : ℂ, 1 < s.re → ζ s = dedekindZeta F s) :
    ζ (-1) = (siegelZetaMinusOne (discr F).natAbs : ℂ) := sorry

/-! ## Layers 0 and 7: the prefix and the index factors of the volume -/

/-- The `Γ_i` type of convention 2: `Γ₀`, `Γ₁` or full level `Γ(𝔑)` (LMFDB `gamma type`
`0`, `1`, `f`). -/
inductive GammaType
  | zero | one | full
  deriving DecidableEq

/-- The ambient group of convention 2: `GL⁺(R ⊕ 𝔟)` (`gl`) or `SL(R ⊕ 𝔟)` (`sl`). -/
inductive AmbientType
  | gl | sl
  deriving DecidableEq

/-- The intrinsic prefix `(𝔑, [𝔟] ∈ Cl⁺(R), i, ambient)` of a Hilbert modular surface
(`README.md`, Layer 7, 7.1). The narrow class group is Tau Ceti's `NarrowClassGroup F`
(`README.md`, Layer 0, 0.2). -/
structure HMSPrefix (F : Type*) [Field F] [NumberField F] where
  /-- The level `𝔑`. -/
  level : Ideal (𝓞 F)
  level_ne_bot : level ≠ ⊥
  /-- The narrow ideal class `[𝔟]` of the component. -/
  component : NarrowClassGroup F
  gammaType : GammaType
  ambient : AmbientType

namespace HMSPrefix

open scoped Classical in
/-- `N(𝔑) ∏_{𝔭 ∣ 𝔑} (1 + N(𝔭)⁻¹)`, the index `[PΓ₀(1)_𝔟 : PΓ₀(𝔑)_𝔟]` (`README.md`, Layer 0, 0.3). -/
noncomputable def levelIndex (𝔑 : Ideal (𝓞 F)) : ℚ :=
  (Ideal.absNorm 𝔑 : ℚ) *
    ∏ 𝔭 ∈ (UniqueFactorizationMonoid.normalizedFactors 𝔑).toFinset, (1 + (Ideal.absNorm 𝔭 : ℚ)⁻¹)

/-- `[R^×_{>0} : R^{×2}] ∈ {1, 2}`, the index of the squares in the totally positive units
(`README.md`, Layer 0, 0.1). -/
noncomputable def unitIndex (F : Type*) [Field F] [NumberField F] : ℕ :=
  (powMonoidHom 2 : (𝓞 F)ˣ →* (𝓞 F)ˣ).range.relIndex totallyPositiveIntegerUnits

end HMSPrefix

end Field

/-! ## Layer 5.2 and convention 11: the Kodaira sets -/

/-- The Enriques–Kodaira table for a **minimal** surface with `q = 0`: the Kodaira dimensions
compatible with `(χ, K²)` (`README.md`, Layer 5, 5.2). -/
def kodairaPossibilitiesMinimal (χ K2 : ℤ) : Finset ℤ :=
  if χ = 1 ∧ (K2 = 8 ∨ K2 = 9) then {-1, 2}
  else if χ = 1 ∧ K2 = 0 then {0, 1}
  else if χ = 2 ∧ K2 = 0 then {0, 1}
  else if 3 ≤ χ ∧ K2 = 0 then {1}
  else if 1 ≤ χ ∧ 1 ≤ K2 then {2}
  else ∅

/-- The Kodaira dimensions compatible with `χ` and a **lower bound** `K2 ≤ K²_{min}`: the union
of the table over `K²_{min} ≥ K2`, which stabilises at `{2}` beyond `9`. This is the LMFDB's
`kodaira_dims` when no certificate is known (`README.md`, *Pinned conventions*, 11; Layer 5,
5.2). -/
def kodairaDims (χ K2 : ℤ) : Finset ℤ :=
  (Finset.Icc K2 (max K2 10)).biUnion (kodairaPossibilitiesMinimal χ)

/-- The values used in the worked examples (`README.md`, *Worked examples*). -/
example : kodairaPossibilitiesMinimal 1 8 = {-1, 2} ∧ kodairaPossibilitiesMinimal 2 0 = {0, 1} ∧
    kodairaPossibilitiesMinimal 1 (-2) = ∅ ∧ kodairaPossibilitiesMinimal 4 10 = {2} := by decide

example : kodairaDims 1 (-2) = {-1, 0, 1, 2} ∧ kodairaDims 2 (-4) = {0, 1, 2} ∧
    kodairaDims 3 (-7) = {1, 2} ∧ kodairaDims 4 (-4) = {1, 2} ∧ kodairaDims 1 8 = {-1, 2} ∧
    kodairaDims 4 1 = {2} := by decide

/-- The minimal table is contained in the lower-bound set (`README.md`, Layer 5, 5.2). -/
theorem kodairaPossibilitiesMinimal_subset_kodairaDims (χ K2 K2min : ℤ) (h : K2 ≤ K2min) :
    kodairaPossibilitiesMinimal χ K2min ⊆ kodairaDims χ K2 := sorry

end TauCetiRoadmap.HilbertModularSurfaces
