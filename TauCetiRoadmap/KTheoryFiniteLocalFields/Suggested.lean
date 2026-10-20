import Mathlib
import TauCeti.Algebra.Module.Torsion.TateModule
import TauCeti.CategoryTheory.GrothendieckGroup.FiniteDimensionalVectorSpace

/-!
# KTheoryFiniteLocalFields: representative target signatures

The roadmap is README.md. This file records suggested forms of light definitions and theorem
signatures statable against the pinned APIs; it is not an exhaustive checklist. It fixes the valuation-coordinate
order in the tame boundary, defines the maximal divisible subgroup using actual additive
subgroups, and states the milestones whose carriers already exist: the compact-tower `lim¹`
vanishing, the Cohen/Witt coefficient embedding and Dwork's ghost criterion, the
characteristic-`p` logarithmic-derivative identity used in the Tate comparison, and the
elementary Tate-module lemmas on Tau Ceti's `TateModule`. The K-theory, homotopy,
logarithmic and trace constructions are targets of the README.
-/

namespace TauCetiRoadmap.KTheoryFiniteLocalFields

-- Degree-zero K-theory of a field is the supplied dimension equivalence, not a new calculation.
#check TauCeti.SplitK0.finrankEquiv

/-! ## Layer 0: completed KU and pullback cohomology -/

/-- §0.1: a countable tower of compact Hausdorff abelian groups has vanishing `lim¹`, that is,
`(xₙ) ↦ (xₙ − fₙ xₙ₊₁)` is onto the product. The transition maps need not be surjective. -/
theorem compactTower_limOne_zero (C : ℕ → Type*) [∀ n, AddCommGroup (C n)]
    [∀ n, TopologicalSpace (C n)] [∀ n, IsTopologicalAddGroup (C n)]
    [∀ n, CompactSpace (C n)] [∀ n, T2Space (C n)] (f : ∀ n, C (n + 1) →ₜ+ C n) :
    Function.Surjective fun x : (∀ n, C n) => fun n => x n - f n (x (n + 1)) := by
  sorry

/-- The discrete tower `ℤ ← ℤ ← ⋯` with transition `×2` has nonzero `lim¹`, so compactness
cannot be dropped from `compactTower_limOne_zero`. -/
theorem not_surjective_int_doubling_tower :
    ¬ Function.Surjective fun x : ℕ → ℤ => fun n => x n - 2 * x (n + 1) := by
  sorry

/-! ## Layer 3: integral K₂ and Moore's theorem -/

namespace Tame

variable {k : Type*} [CommRing k]

/-- The residue-coordinate expression for the left-linear boundary:
`∂{π^r u, π^s v} = (-1)^(r*s) * ū^s * v̄^(-r)`.
This is the coordinate form of the tame symbol; its agreement with the boundary on K₂ is the
K2SymbolsBrauer comparison cited in the README, not a definition of K₂. -/
def tameCoordinate (r s : ℤ) (u v : kˣ) : kˣ :=
  (-1 : kˣ) ^ (r * s) * u ^ s * v ^ (-r)

/-- Changing the order of the two inputs inverts the boundary. -/
theorem tameCoordinate_swap (r s : ℤ) (u v : kˣ) :
    tameCoordinate s r v u = (tameCoordinate r s u v)⁻¹ := by
  sorry

/-- Replacing `π` by `cπ` changes the unit coordinates by `c^(-r)` and `c^(-s)`.
The residue boundary itself is independent of the uniformizer. -/
theorem tameCoordinate_change_uniformizer (r s : ℤ) (u v c : kˣ) :
    tameCoordinate r s (c ^ (-r) * u) (c ^ (-s) * v) =
      tameCoordinate r s u v := by
  sorry

/-- Multiplication in the first valuation/unit pair gives multiplication of the coordinates. -/
theorem tameCoordinate_mul_left (r₁ r₂ s : ℤ) (u₁ u₂ v : kˣ) :
    tameCoordinate (r₁ + r₂) s (u₁ * u₂) v =
      tameCoordinate r₁ s u₁ v * tameCoordinate r₂ s u₂ v := by
  sorry

/-- A unit followed by a uniformizer has boundary the unit itself, `∂{2, π} = 2` in `𝔽₅`;
the inverse convention would give `3`. -/
example :
    ((tameCoordinate 0 1 (ZMod.unitOfCoprime 2 (by decide)) 1 : (ZMod 5)ˣ) : ZMod 5) = 2 := by
  decide

/-- Two uniformizers detect the sign, even when both unit coordinates are trivial. -/
example :
    ((tameCoordinate 1 1 (1 : (ZMod 5)ˣ) 1 : (ZMod 5)ˣ) : ZMod 5) = 4 := by
  decide

end Tame

/-! ## Layer 5: logarithmic Witt and residue-characteristic calculations -/

section Witt

variable (p : ℕ) [Fact p.Prime]

/-- §5.2: a complete discrete valuation ring of mixed characteristic `(0, p)` with perfect
residue field `k` receives an injective ring map `W(k) → A` lifting the identity of `k`.
The residue field need not be finite. -/
theorem exists_wittVector_coefficientEmbedding (A : Type*) [CommRing A] [IsDomain A]
    [IsDiscreteValuationRing A] [CharZero A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [CharP (IsLocalRing.ResidueField A) p] [PerfectRing (IsLocalRing.ResidueField A) p] :
    ∃ f : WittVector p (IsLocalRing.ResidueField A) →+* A, Function.Injective f ∧
      (IsLocalRing.residue A).comp f = WittVector.constantCoeff := by
  sorry

/-- §5.2, Dwork's criterion: for a Frobenius lift `φ`, a sequence is the ghost sequence of a
Witt vector exactly when `wₛ₊₁ ≡ φ(wₛ)` modulo `p ^ (s + 1)`. -/
theorem exists_ghostComponent_eq_iff {R : Type*} [CommRing R] (φ : R →+* R)
    (hφ : ∀ x, φ x - x ^ p ∈ Ideal.span {(p : R)}) (w : ℕ → R) :
    (∃ x : WittVector p R, ∀ n, WittVector.ghostComponent n x = w n) ↔
      ∀ s, w (s + 1) - φ (w s) ∈ Ideal.span {(p : R) ^ (s + 1)} := by
  sorry

/-- §5.12, the elementary input to the Tate comparison: in characteristic `p`, the
coefficients `aᵢ` of the logarithmic derivative `X u′ / u` of a unit power series satisfy
`a_(p i) = aᵢ ^ p`. Here `v` is the inverse of `u`. -/
theorem coeff_X_logDeriv_mul_char {k : Type*} [CommRing k] [CharP k p]
    {u v : PowerSeries k} (huv : u * v = 1) (i : ℕ) :
    PowerSeries.coeff (p * i) (PowerSeries.X * PowerSeries.derivative (R := k) u * v) =
      PowerSeries.coeff i (PowerSeries.X * PowerSeries.derivative (R := k) u * v) ^ p := by
  sorry

end Witt

/-! ## Layer 6: completed and integral higher K-groups of local fields -/

namespace Divisible

variable (A : Type*) [AddCommGroup A]

/-- The supremum of the divisible additive subgroups of an abelian group.
Divisibility is expressed as surjectivity of every positive integer multiplication. -/
def maxDivisible : AddSubgroup A :=
  sSup {D : AddSubgroup A | ∀ n : ℕ, n ≠ 0 → ∀ x : D, ∃ y : D, n • y = x}

/-- This subgroup is itself divisible in Mathlib's sense. -/
theorem maxDivisible_divisible : Nonempty (DivisibleBy (maxDivisible A) ℤ) := by
  sorry

/-- Membership means membership in an actual divisible subgroup, not merely a sequence of
unrelated divisions in the ambient group. -/
theorem mem_maxDivisible_iff (a : A) :
    a ∈ maxDivisible A ↔ ∃ D : AddSubgroup A,
      (∀ n : ℕ, n ≠ 0 → ∀ x : D, ∃ y : D, n • y = x) ∧ a ∈ D := by
  sorry

/-- Divisible groups are exactly those for which the maximal divisible subgroup is all. -/
theorem maxDivisible_eq_top_iff :
    maxDivisible A = ⊤ ↔ Nonempty (DivisibleBy A ℤ) := by
  sorry

/-- The quotient by the maximal divisible subgroup is reduced. -/
theorem maxDivisible_quotient : maxDivisible (A ⧸ maxDivisible A) = ⊥ := by
  sorry

/-- Divisibility gives an internal complement, with no preferred choice of complement. -/
theorem exists_isCompl_maxDivisible :
    ∃ C : AddSubgroup A, IsCompl (maxDivisible A) C := by
  sorry

/-- The maximal divisible subgroup is functorial for additive homomorphisms. -/
theorem map_maxDivisible_le {B : Type*} [AddCommGroup B] (f : A →+ B) :
    (maxDivisible A).map f ≤ maxDivisible B := by
  sorry

/-- Finite products preserve the maximal divisible subgroup. -/
theorem maxDivisible_prod (B : Type*) [AddCommGroup B] :
    maxDivisible (A × B) = (maxDivisible A).prod (maxDivisible B) := by
  sorry

/-- A finite abelian group has no nonzero divisible subgroup. -/
theorem maxDivisible_eq_bot_of_finite [Finite A] : maxDivisible A = ⊥ := by
  sorry

/-- §6.1's criterion: if `w ≠ 0` and `(m * w) • A = w • A` for every positive `m`, then `w • A`
is the maximal divisible subgroup. Moore's theorem uses it for `U(E) = w K₂(E)`. -/
theorem range_nsmul_eq_maxDivisible {w : ℕ} (hw : w ≠ 0)
    (h : ∀ m : ℕ, m ≠ 0 →
      (nsmulAddMonoidHom (α := A) (m * w)).range = (nsmulAddMonoidHom (α := A) w).range) :
    (nsmulAddMonoidHom (α := A) w).range = maxDivisible A := by
  sorry

/-- The rational additive group is divisible. -/
example : maxDivisible ℚ = ⊤ := by
  apply top_unique
  apply le_sSup
  intro n hn x
  refine ⟨⟨(x : ℚ) / (n : ℚ), trivial⟩, ?_⟩
  apply Subtype.ext
  change n • ((x : ℚ) / (n : ℚ)) = (x : ℚ)
  rw [nsmul_eq_mul]
  exact mul_div_cancel₀ _ (by exact_mod_cast hn)

/-- A finite-exponent group cannot contain a nonzero divisible subgroup. -/
example : maxDivisible (ZMod 6) = ⊥ := by
  apply le_antisymm
  · apply sSup_le
    intro D hD x hx
    obtain ⟨y, hy⟩ := hD 6 (by decide) ⟨x, hx⟩
    change x = 0
    have h : (6 : ℕ) • (y : ZMod 6) = 0 := by
      rw [nsmul_eq_mul, ZMod.natCast_self, zero_mul]
    exact (congrArg Subtype.val hy).symm.trans h
  · exact bot_le

/-- Integer divisibility is not the subgroup `wℤ` for a fixed positive `w`: `ℤ` is reduced. -/
theorem maxDivisible_int : maxDivisible ℤ = ⊥ := by
  sorry

end Divisible

section TateModule

open TauCeti

variable (p : ℕ) [Fact p.Prime]

/-- §6.2: the Tate module is left exact. -/
theorem tateModule_left_exact {B' B B'' : Type*} [AddCommGroup B'] [AddCommGroup B]
    [AddCommGroup B''] (f : B' →+ B) (g : B →+ B'') (hf : Function.Injective f)
    (hfg : f.range = g.ker) :
    Function.Injective (TateModule.mapLinearMap (p := p) f) ∧
      LinearMap.range (TateModule.mapLinearMap (p := p) f) =
        LinearMap.ker (TateModule.mapLinearMap (p := p) g) := by
  sorry

/-- §6.2: the Tate module has no `ℤ_p`-torsion. -/
theorem tateModule_torsionFree (B : Type*) [AddCommGroup B] :
    Module.IsTorsionFree ℤ_[p] (TateModule p B) := by
  sorry

/-- §6.2: if `p ^ N` kills the whole `p`-power torsion of `B`, then `T_p B = 0`. No
finite-generation hypothesis is needed. -/
theorem tateModule_eq_zero_of_boundedExponent {B : Type*} [AddCommGroup B] (N : ℕ)
    (hN : ∀ b : B, (∃ k : ℕ, p ^ k • b = 0) → p ^ N • b = 0) :
    Subsingleton (TateModule p B) := by
  sorry

/-- §6.2: `T_p((ℚ_p/ℤ_p)^r) ≃ ℤ_p^r` for finite `r`. -/
theorem tateModule_prufer_pow (r : ℕ) :
    Nonempty (TateModule p (Fin r → ℚ_[p] ⧸ (PadicInt.subring p).toAddSubgroup) ≃ₗ[ℤ_[p]]
      (Fin r → ℤ_[p])) := by
  sorry

end TateModule

/-
The README also specifies the following constructions, whose carriers are not present at the
pins: the compact augmentation-kernel tower, continuous completed Adams operations, the
multiplicative Eilenberg–Moore pullback comparison and height-one module realization,
finite-coefficient and completed K-theory, Bott classes, profinite changes of the supplied
Brauer comparison, normalized relative Chern classes, finite-field restriction and transfer,
the universal equivariant Chern/slant and Moore–Hurewicz maps, the finite-field edge, the Lang
torsor and its geometric classifying comparison, henselian rigidity and the prime-to-p
localization splittings, the full norm-residue map and its kernel, the linear Waldhausen THH
model, classical TR and TC, the Connes operator, the HM Tate-cochain comparison and Tate
spectral sequence, the logarithmic DVR THH/TR/TC objects, the absolute logarithmic
de Rham–Witt complex, the residue coefficient map on Witt vectors modulo p, modified
Verschiebung, the Frobenius-twisted derivation and hW module, logarithmic trace structure
maps, the normalized log-THH class κ, the Lubin–Tate unit and α coordinates, TR Bott classes,
the Geisser–Levine comparisons, the Dwyer–Friedlander comparison, the étale edge and Chern
maps, the weightwise twisted-TR inverse limits, the local Iwasawa module and the height-one
splitting, the dyadic hermitian comparison, and the arithmetic and semilocal completion maps.
-/

end TauCetiRoadmap.KTheoryFiniteLocalFields
