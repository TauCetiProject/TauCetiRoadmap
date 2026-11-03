module

public import Mathlib
public import TauCeti.NumberTheory.NumberField.TotallyPositive

/-!
# Hilbert modular surfaces: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
arithmetic theorems against the pinned APIs: the fundamental multiplier theorem for a minus
period, negative definiteness and duality of cusp cycles, and Siegel's value at minus one.

The following geometric headlines are not statable at the pins with a few simple definitions:
* Hirzebruch's cusp resolution (§2.4) lacks the arithmetic analytic cusp chart and its resolution.
* The elliptic-point count and cyclic quotient resolution (§§3.4, 3.10) lack the Hilbert
  congruence quotient and its marked local quotient charts.
* The Chern-number and Hodge-number formulas (§§4.4, 4.6–4.8) lack the constructed compactified
  Hilbert surface and its comparison with holomorphic automorphic forms.
* Rationality for the smallest discriminants (§6.3), the level-one classification (§6.4),
  and the general-type and higher-level results (§6.5) lack that surface and its
  Hirzebruch–Zagier divisors and minimal model.
No arithmetic table or freely supplied geometric predicate replaces those statements.

All cusp statements use distinct ordered real embeddings of a degree-two number field.
A lattice is finitely generated of rank two; its multiplier subgroup has nonzero relative
index. For a one-component cycle the diagonal is `2-b`; for a two-component cycle the
intersection multiplicity is two. These exceptional cases belong to the same matrix definition.
The elementary stream, digit, reducedness, orientation and multiplier definitions make sense
in any field with the indicated embeddings; their theorems retain the number-field hypotheses.
-/

@[expose] public section

namespace TauCetiRoadmap.HilbertModularSurfaces

open NumberField

/-! ## Layer 2: minus periods and cusp cycles -/

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

open Classical in
/-- The period `(b₁, …, b_d)` of a purely periodic stream: the digits of the shortest cycle,
`[]` when the stream never returns to `w` (`README.md`, Layer 2, 2.2). -/
noncomputable def hjPeriod (v₁ : F →+* ℝ) (w : F) : List ℤ :=
  if h : ∃ d, 0 < d ∧ hjStream v₁ w d = w then
    (List.range (Nat.find h)).map (hjDigit v₁ w) else []

/-- A basis `(x, y)` of a lattice is **oriented** when `v₁(x)v₂(y) − v₂(x)v₁(y) > 0`
(`README.md`, *Conventions*, 5). -/
def IsOriented (v₁ v₂ : F →+* ℝ) (x y : F) : Prop := 0 < v₁ x * v₂ y - v₂ x * v₁ y

/-- The totally positive units of the multiplier ring of a `ℤ`-submodule `M ⊆ F`: the totally
positive `u ∈ Fˣ` with `uM = M` (`README.md`, *Conventions*, 5 and 7, the group `U_M^+`). -/
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

/-- A reduced quadratic irrational has a nonempty minus period. Its complete-quotient product
is the fundamental totally positive multiplier of the actual lattice `ℤ + ℤ w`: it exceeds
one at the first embedding and its integer powers exhaust the positive multiplier units
(Hirzebruch 1973, §2.5, lemma preceding (19)). -/
theorem hjPeriod_ne_nil_of_isReduced (v₁ v₂ : F →+* ℝ) (hv : v₁ ≠ v₂)
    (hF : Module.finrank ℚ F = 2) {w : F} (hw : IsReduced v₁ v₂ w)
    (hirr : w ∉ Set.range ((↑) : ℚ → F)) :
    hjPeriod v₁ w ≠ [] ∧
      ∃ ε : Fˣ,
        (ε : F) = ((List.range (hjPeriod v₁ w).length).map
          (fun j => hjStream v₁ w (j + 1))).prod ∧
        1 < v₁ (ε : F) ∧
        ε ∈ multiplierUnits (Submodule.span ℤ ({1, w} : Set F)) ∧
        ∀ u ∈ multiplierUnits (Submodule.span ℤ ({1, w} : Set F)),
          ∃ n : ℤ, u = ε ^ n := sorry

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

/-- `k = [U_M^+ : V]`, the LMFDB's `repetition` (`README.md`, *Conventions*, 7). -/
noncomputable def repetition : ℕ := D.V.relIndex (multiplierUnits D.M)

open Classical in
/-- The period `(b₁, …, b_d)` of `v₁(x/y)` for an oriented basis `(x, y)` of `M`, read off an
oriented basis whose quotient is reduced, where the expansion is purely periodic; such a basis
exists because the stream of any oriented basis is eventually reduced (2.2). The starting point is
a choice, so the period is compared only as a `Cycle` (`README.md`,
Layer 2, 2.2–2.3). -/
noncomputable def period (v₁ v₂ : F →+* ℝ) (D : CuspDatum F) : List ℤ :=
  if h : ∃ x y : F, IsOriented v₁ v₂ x y ∧ Submodule.span ℤ {x, y} = D.M ∧ IsReduced v₁ v₂ (x / y)
  then hjPeriod v₁ (h.choose / h.choose_spec.choose) else []

/-- The resolution cycle of convention 7: `(−b₁, …, −b_d)` repeated `k` times
(`README.md`, *Conventions*, 7; Layer 2, 2.3). -/
noncomputable def resolutionCycle (v₁ v₂ : F →+* ℝ) : List ℤ :=
  (List.replicate D.repetition ((D.period v₁ v₂).map fun b => -b)).flatten

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

/-- Multiplication of a cusp lattice by an element of negative norm gives the dual period;
the sums of the digits minus three have opposite signs. The period depends on the lattice
alone, so no condition relates the multiplier groups of the two data (README §2.7). -/
theorem period_dual (v₁ v₂ : F →+* ℝ) (hv : v₁ ≠ v₂)
    (hF : Module.finrank ℚ F = 2) (E : CuspDatum F) (β : F)
    (hβ : v₁ β * v₂ β < 0)
    (hM : (E.M : Set F) = (fun x => β * x) '' (D.M : Set F)) :
    ((D.period v₁ v₂).map fun b => b - 3).sum =
      -((E.period v₁ v₂).map fun b => b - 3).sum := sorry

end CuspDatum

/-! ## Layer 4.2: Siegel's formula -/

open ArithmeticFunction in
/-- `(1/60) Σ_{b ∈ ℤ, b² < D, b ≡ D mod 2} σ₁((D − b²)/4)`, Siegel's closed form for `ζ_F(−1)`
(`README.md`, *Conventions*, 12; Layer 4, 4.2). -/
def siegelZetaMinusOne (D : ℕ) : ℚ :=
  (1 / 60 : ℚ) * ∑ b ∈ (Finset.Icc (-(D : ℤ)) D).filter (fun b => b ^ 2 < (D : ℤ) ∧ b % 2 = D % 2),
    (sigma 1 (((D : ℤ) - b ^ 2) / 4).toNat : ℚ)

/-- Siegel's theorem: the meromorphic continuation of Mathlib's `dedekindZeta F` takes the value
`siegelZetaMinusOne |discr F|` at `−1`. The continuation is pinned by meromorphy on `ℂ` and
agreement with the Dirichlet series on `Re s > 1`, together with analyticity at `−1`,
which fixes its value there
(`README.md`, Layer 4, 4.2). -/
theorem dedekindZeta_neg_one_eq_siegel [IsTotallyReal F] (hF : Module.finrank ℚ F = 2)
    (ζ : ℂ → ℂ) (hζ : MeromorphicOn ζ Set.univ) (hregular : AnalyticAt ℂ ζ (-1))
    (hagree : ∀ s : ℂ, 1 < s.re → ζ s = dedekindZeta F s) :
    ζ (-1) = (siegelZetaMinusOne (discr F).natAbs : ℂ) := sorry

end Field

end TauCetiRoadmap.HilbertModularSurfaces
