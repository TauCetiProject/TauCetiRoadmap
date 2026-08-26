import Mathlib
import TauCeti.NumberTheory.ModularForms.DiamondOperators
import TauCeti.NumberTheory.ModularForms.LevelOne.GradedRing

/-!
# Theta series of lattices: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for the load-bearing milestones, so that
contributors and reviewers converge on the carrier, the conventions, and the shape of the two
modularity theorems. Discharging every declaration here would finish neither a layer nor the
roadmap. `sorry` is permitted in this human-owned repository: these are targets, not
implementations.

The carrier is a full `ℤ`-lattice in a finite-dimensional **real inner product space**, expressed
by `Submodule ℤ E` with Mathlib's `IsZLattice ℝ L` — deliberately *not* the rational carrier of the
[integral-lattices roadmap](../IntegralLattices/README.md), because the theta series needs a real
norm to converge and Poisson summation needs the covolume. The bridge between the two models is
`ratModel` below, and all discriminant-form theory is consumed across it.

Two conventions are visible in every signature and are the point of seeding this file at all.
First, the exponent is `π * I * ‖v‖ ^ 2 * τ`, so that for an even lattice the `q`-expansion is
indexed by `‖v‖ ^ 2 / 2` and matches `E₄` and `Δ` without a rescaling. Second, **rank is even**,
`n = 2 * k`, so every automorphy factor is `(-I) ^ k * τ ^ k` at `Monoid.npow`:
`Complex.cpow` does not occur below, and if a contributor finds themselves reaching for it the
even-rank hypothesis has been dropped upstream.

⚠ The *route* of Layer 5 — the presentation of `SL(2, ℤ)`, the Weil representation on `ℂ[A_L]`,
the Gauss sums and Milgram's formula — quantifies over the finite-quadratic-module types that the
integral-lattices roadmap introduces and Tau Ceti does not yet have; freezing names for those
intermediates against placeholder structures would not check interface coherence, so they stay in
`README.md` until the types land. Layer 5's **endpoint statements** are seeded below all the same:
the Hecke–Schoeneberg theorem mentions only the level, the Kronecker character, Mathlib's
congruence subgroups, and Tau Ceti's landed `modFormCharSpace`, none of which waits on
discriminant forms. The Layer-6 identifications are seeded, since their types are all Mathlib's.
-/

namespace TauCetiRoadmap.ThetaSeries

open Complex Real MeasureTheory UpperHalfPlane ModularForm CongruenceSubgroup
open scoped MatrixGroups RealInnerProductSpace SchwartzMap FourierTransform
open scoped ArithmeticFunction.sigma

noncomputable section

variable {E F : Type*}
  [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]

/-! ## Layer 0: the real lattice model and its arithmetic invariants -/

section Model

variable (L : Submodule ℤ E)

/-- The dual lattice, literally Mathlib's `BilinForm.dualSubmodule` for the inner product.
There is no second dual-lattice notion in this development. -/
def dual : Submodule ℤ E := (innerₗ E).dualSubmodule L

@[inherit_doc] scoped notation:max L "^∨" => TauCetiRoadmap.ThetaSeries.dual L

/-- Integrality. The definition of record is the submodule inequality; the elementwise form is
`isIntegral_iff` below. -/
def IsIntegral : Prop := L ≤ L^∨

theorem isIntegral_iff : IsIntegral L ↔ ∀ x ∈ L, ∀ y ∈ L, ∃ m : ℤ, ⟪x, y⟫ = (m : ℝ) := sorry

/-- Evenness: every norm is an even integer. Not implied by, and strictly stronger than,
`IsIntegral`. -/
def IsEven : Prop := ∀ x ∈ L, ∃ m : ℤ, ‖x‖ ^ 2 = 2 * (m : ℝ)

theorem isIntegral_of_isEven (h : IsEven L) : IsIntegral L := sorry

/-- Unimodularity is self-duality. That it is equivalent to `covolume = 1` for an integral lattice
is `isUnimodular_iff_covolume_eq_one`, a theorem, not an alternative definition. -/
def IsUnimodular : Prop := L = L^∨

/-- The determinant of a lattice: the square of the covolume. For an integral lattice this is a
positive integer, equal to `|det Gram|` and to `[L^∨ : L]`. -/
def det (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] : ℝ :=
  (ZLattice.covolume L volume) ^ 2

variable [DiscreteTopology L] [IsZLattice ℝ L]

instance : DiscreteTopology (L^∨) := sorry
instance : IsZLattice ℝ (L^∨) := sorry

theorem covolume_dual : ZLattice.covolume (L^∨) volume = (ZLattice.covolume L volume)⁻¹ := sorry

theorem exists_det_eq_natCast (h : IsIntegral L) : ∃ d : ℕ, 0 < d ∧ det L = d := sorry

theorem det_eq_index (h : IsIntegral L) : det L = Nat.card (L^∨ ⧸ L.comap (L^∨).subtype) := sorry

/-- The bridge a consumer needs: the sphere-packing predicate `covolume = 1` on an integral lattice
*is* self-duality. -/
theorem isUnimodular_iff_covolume_eq_one (h : IsIntegral L) :
    IsUnimodular L ↔ ZLattice.covolume L volume = 1 := sorry

/-- The level of an even lattice: the least `N > 0` with `N * ‖x‖ ^ 2 / 2 ∈ ℤ` for every `x` in the
dual. Equivalently the order of the discriminant quadratic form. Junk (`0`) off `IsEven`. -/
def level : ℕ :=
  sInf {N : ℕ | 0 < N ∧ ∀ x ∈ L^∨, ∃ m : ℤ, (N : ℝ) * ‖x‖ ^ 2 / 2 = m}

theorem level_pos (h : IsEven L) : 0 < level L := sorry

theorem level_eq_one_iff (h : IsEven L) : level L = 1 ↔ IsUnimodular L := sorry

/-- The shell of squared norm `t`, as a `Set` with a finiteness theorem — not a `Finset` behind a
decidability instance, since the finiteness is the content. -/
def shell (t : ℝ) : Set E := {v : E | v ∈ L ∧ ‖v‖ ^ 2 = t}

theorem finite_shell (t : ℝ) : (shell L t).Finite := sorry

/-- The representation numbers. -/
def repNum (t : ℝ) : ℕ := (shell L t).ncard

theorem repNum_zero : repNum L 0 = 1 := sorry

end Model

/-! ### The bridge to the rational carrier of the integral-lattices roadmap

The `ℚ`-span of an integral lattice inside `E` carries the restricted inner product as a symmetric
positive-definite integral `BilinForm ℚ`, and the discriminant group and forms computed there agree
with those computed in `E`. This is the *only* place the two models are compared; afterwards,
discriminant-form facts are quoted across it and never reproved in `E`.

⚠ Not seeded with a full signature: the target type is the integral-lattices roadmap's
`IntegralLattice V`, which Tau Ceti does not yet have. The statement is in `README.md`, Layer 0. -/

/-! ### The Kronecker symbol and the nebentypus

Mathlib's `jacobiSym` handles odd denominators only; the Kronecker symbol extends it to all of `ℤ`
and is a Layer-0 target in its own right, independent of any lattice. -/

/-- The Kronecker symbol `(a / b)`: the completely multiplicative extension of `jacobiSym` to all
`b : ℤ`, with the standard values at `2`, `-1`, and `0`. -/
def kroneckerSym (a b : ℤ) : ℤ := sorry

theorem kroneckerSym_eq_jacobiSym (a : ℤ) {b : ℕ} (hb : Odd b) :
    kroneckerSym a b = jacobiSym a b := sorry

section Nebentypus

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- For an even lattice of rank `2k`, the signed determinant `(-1)^k det L` is a discriminant:
`≡ 0` or `1 mod 4`. This is what makes the Kronecker character below periodic. -/
theorem neg_one_pow_mul_det_modEq (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) {d : ℕ} (hd : det L = d) :
    ((-1) ^ k * d : ℤ) ≡ 0 [ZMOD 4] ∨ ((-1) ^ k * d : ℤ) ≡ 1 [ZMOD 4] := sorry

/-- The nebentypus of an even lattice of rank `2 * k`: the Kronecker character
`d ↦ ((-1)^k * det L / d)` of the signed determinant, as a Dirichlet character modulo the level.
Junk off `IsEven`. This is a *definition* here and a *theorem* in Layer 5: that it is what the
transformation law actually produces on `Γ₀(N)` is the content of Hecke–Schoeneberg. -/
def discChar (k : ℕ) : DirichletCharacter ℂ (level L) := sorry

/-- The defining evaluation: away from the level, `χ_L` is the Kronecker symbol of the signed
determinant. That this prescription is well defined modulo the level is the content of `discChar`'s
construction, via `neg_one_pow_mul_det_modEq`. (Its conductor dividing the level is then Mathlib's
generic `DirichletCharacter.conductor_dvd_level`, not a target.) -/
theorem discChar_intCast (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L)
    {d : ℕ} (hd : det L = d) {a : ℤ} (ha : IsCoprime a (level L : ℤ)) :
    discChar L k (a : ZMod (level L)) = (kroneckerSym ((-1) ^ k * d) a : ℂ) := sorry

/-- Parity: `χ_L(-1) = (-1)^k`, the compatibility with the weight demanded by the modular-forms
roadmap's parity lemma `M_k(N, χ) ≠ 0 → χ(-1) = (-1)^k`. -/
theorem discChar_neg_one (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L) :
    discChar L k (-1) = (-1) ^ k := sorry

end Nebentypus

/-! ## Layer 1: Poisson summation for a lattice -/

section Poisson

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- **Poisson summation for a full-rank `ℤ`-lattice.** Mathlib has the case `ℤ ⊆ ℝ` only
(`SchwartzMap.tsum_eq_tsum_fourier`); this is the general statement, proved from it by a linear
change of variables, not by induction on the dimension.

⚠ The sign of the character is fixed by Mathlib's `𝓕`, which carries `exp (-2 π i ⟪x, y⟫)`; sources
writing `exp (-2 π i ⟪v, m⟫)` on the right agree after `m ↦ -m`. -/
theorem poissonSummation (f : 𝓢(E, ℂ)) (v : E) :
    ∑' ℓ : L, f (v + (ℓ : E)) =
      (ZLattice.covolume L volume)⁻¹ *
        ∑' m : L^∨, 𝓕 (fun x : E => f x) (m : E) * cexp (2 * π * I * ⟪v, (m : E)⟫) := sorry

theorem summable_poisson_left (f : 𝓢(E, ℂ)) (v : E) :
    Summable fun ℓ : L => f (v + (ℓ : E)) := sorry

theorem summable_poisson_right (f : 𝓢(E, ℂ)) (v : E) :
    Summable fun m : L^∨ => 𝓕 (fun x : E => f x) (m : E) * cexp (2 * π * I * ⟪v, (m : E)⟫) :=
  sorry

/-- The Gaussian on `E`, Schwartz for `0 < τ.im`. -/
def gaussian (τ : ℍ) : 𝓢(E, ℂ) := sorry

theorem gaussian_apply (τ : ℍ) (x : E) : gaussian τ x = cexp (π * I * (‖x‖ ^ 2 : ℝ) * τ) := sorry

/-- The Fourier transform of the Gaussian, in the exact shape Layer 3 consumes, and with the
even-rank exponent `n = 2 * k` an honest `Monoid.npow`. Mathlib's inner-product-space Gaussian
Fourier transform is the input; this is a repackaging, not a reproof. -/
theorem fourier_gaussian (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (τ : ℍ) (y : E) :
    𝓕 (fun x : E => (gaussian τ : E → ℂ) x) y =
      ((-I) ^ k * (τ : ℂ) ^ k)⁻¹ * cexp (π * I * (‖y‖ ^ 2 : ℝ) * (-1 / (τ : ℂ))) := sorry

end Poisson

/-! ## Layer 2: the theta series -/

section Theta

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- The theta series of a lattice. ⚠ The exponent is `π I ‖v‖² τ`, not `2 π I ‖v‖² τ`. -/
def thetaSeries (τ : ℍ) : ℂ := ∑' v : L, cexp (π * I * (‖(v : E)‖ ^ 2 : ℝ) * τ)

/-- The theta series of a coset of `L` in its dual. Depends only on the class of `γ` in `L^∨ / L`
(`thetaCoset_add_mem`), and satisfies `θ_{-γ} = θ_γ` (`thetaCoset_neg`) — which is why the family
`(θ_γ)` is *not* linearly independent, and why the Weil representation of Layer 5 cannot be read off
transition matrices between theta functions. -/
def thetaCoset (γ : E) (τ : ℍ) : ℂ := ∑' v : L, cexp (π * I * (‖γ + (v : E)‖ ^ 2 : ℝ) * τ)

theorem summable_thetaSeries (τ : ℍ) :
    Summable fun v : L => cexp (π * I * (‖(v : E)‖ ^ 2 : ℝ) * τ) := sorry

theorem thetaCoset_add_mem (γ : E) {w : E} (hw : w ∈ L) : thetaCoset L (γ + w) = thetaCoset L γ :=
  sorry

theorem thetaCoset_neg (γ : E) : thetaCoset L (-γ) = thetaCoset L γ := sorry

theorem mdifferentiable_thetaSeries : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) (thetaSeries L) := sorry

/-- Positivity on the imaginary axis: the nonvanishing witness the rank argument of Layer 4 needs.
One line here, a nuisance later. -/
theorem thetaSeries_pos {y : ℝ} (hy : 0 < y) :
    0 < (thetaSeries L ⟨y * I, by sorry⟩).re := sorry

/-- The `q`-expansion of an even lattice: coefficients are the representation numbers. -/
theorem hasSum_thetaSeries (h : IsEven L) (τ : ℍ) :
    HasSum (fun m : ℕ => (repNum L (2 * m) : ℂ) * cexp (2 * π * I * τ) ^ m) (thetaSeries L τ) :=
  sorry

theorem thetaSeries_orthogonal_sum (M : Submodule ℤ F) [DiscreteTopology M] [IsZLattice ℝ M] :
    True := sorry -- `Θ_{L ⊕ M} = Θ_L · Θ_M` in `WithLp 2 (E × F)`; see README, Layer 2.

/-- The convention check: at rank one this is Mathlib's `jacobiTheta`. If this fails, the exponent
or the norm convention is wrong, and it is far cheaper to find out here. -/
theorem thetaSeries_int : True := sorry -- `thetaSeries (ℤ ∙ 1) = jacobiTheta`; see README, Layer 2.

end Theta

/-! ## Layer 3: the two transformation laws -/

section Transformation

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- Translation. ⚠ Evenness is exactly what this needs; integrality is not enough. -/
theorem thetaSeries_add_one (h : IsEven L) (τ : ℍ) :
    thetaSeries L (⟨(τ : ℂ) + 1, by sorry⟩) = thetaSeries L τ := sorry

/-- Inversion, scalar form. No integrality hypothesis: this is Poisson summation at `v = 0`. -/
theorem thetaSeries_neg_inv (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (τ : ℍ) :
    thetaSeries L (⟨-1 / (τ : ℂ), by sorry⟩) =
      (ZLattice.covolume L volume)⁻¹ * (-I) ^ k * (τ : ℂ) ^ k * thetaSeries (L^∨) τ := sorry

/-- Inversion, vector-valued. The character `exp (2 π i ⟪γ, m⟫)` descends to `L^∨ / L` precisely
because `γ ∈ L^∨`. ⚠ Not seeded with the sum over `L^∨ / L`, which needs the discriminant group of
the integral-lattices roadmap; the statement is in `README.md`, Layer 3. -/
theorem thetaCoset_neg_inv : True := sorry

end Transformation

/-! ## Layer 4: level one -/

section LevelOne

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- **The rank of an even unimodular lattice is divisible by `8`.** Proved at this layer by the
elementary route (pass to `L ⊕ L` or `L ⊕ L ⊕ L ⊕ L` to reach rank `≡ 4 mod 8`, then contradict
`Θ ≠ 0`), and again in Layer 5 in one line from Milgram's formula. Both proofs are wanted. -/
theorem eight_dvd_finrank_of_even_unimodular (he : IsEven L) (hu : IsUnimodular L) :
    8 ∣ Module.finrank ℝ E := sorry

/-- The theta series of an even unimodular lattice, as a level-one modular form of weight `n / 2`.
Built the way Mathlib builds `CuspForm.discriminant`: the two laws of Layer 3 plus
`SlashInvariantForm.slash_action_generators_SL2Z`. -/
def thetaForm (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L) (hu : IsUnimodular L) :
    ModularForm 𝒮ℒ (k : ℤ) := sorry

@[simp] theorem coe_thetaForm (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) (hu : IsUnimodular L) :
    ⇑(thetaForm L k hn he hu) = thetaSeries L := sorry

theorem qExpansion_thetaForm_coeff (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) (hu : IsUnimodular L) (m : ℕ) :
    (qExpansion 1 (thetaForm L k hn he hu)).coeff m = (repNum L (2 * m) : ℂ) := sorry

/-- The structural corollary: in weights divisible by `4`, the level-one graded ring is generated by
`E₄` and `Δ`, so the theta series of an even unimodular lattice is a polynomial in the two. Consumes
Tau Ceti's landed `mvPolynomialEquivModularForms` and `E₆ ^ 2 = E₄ ^ 3 - 1728 Δ`. -/
theorem exists_polynomial_E₄_discriminant (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) (hu : IsUnimodular L) :
    ∃ c : ℕ × ℕ →₀ ℂ, True := sorry -- `Θ_L = ∑ c (a, b) • E₄ ^ a * Δ ^ b`, `4 a + 12 b = k`.

end LevelOne

/-! ## Layer 5: general level — the Hecke–Schoeneberg theorem

Only the **endpoint statements** are seeded. Their types are Mathlib's congruence subgroups and
slash action, Tau Ceti's landed `modFormCharSpace`, and this file's `level` and `discChar` — none
of which waits on discriminant-form types. The route of record — the presentation of `SL(2, ℤ)`,
the Weil representation on `ℂ[A_L]`, the Gauss sums and Milgram's formula — does quantify over the
finite-quadratic-module types of the integral-lattices roadmap, which Tau Ceti does not yet have;
those intermediate targets stay in `README.md`, Layer 5, until the types land. -/

section GeneralLevel

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- **Hecke–Schoeneberg, classical spelling**: slashing the theta series of an even lattice of even
rank `2k` by an element of `Γ₀(N)`, `N` the level, multiplies it by the nebentypus at the
lower-right entry. Layer 4 is the case `N = 1`. -/
theorem thetaSeries_slash_of_mem_Gamma0 (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) {A : SL(2, ℤ)} (hA : A ∈ Gamma0 (level L)) :
    thetaSeries L ∣[(k : ℤ)] A = discChar L k (A 1 1 : ZMod (level L)) • thetaSeries L := sorry

/-- The coset theta series are modular forms on the principal congruence subgroup `Γ(N)` — the
componentwise face of vector-valued modularity, and the part the alternative (Schoeneberg,
presentation-free) route of `README.md` does *not* deliver. -/
theorem exists_modularForm_coe_eq_thetaCoset (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) {γ : E} (hγ : γ ∈ L^∨) :
    ∃ F : ModularForm ((Gamma (level L)).map (Matrix.SpecialLinearGroup.mapGL ℝ)) (k : ℤ),
      ⇑F = thetaCoset L γ := sorry

/-- The theta series of an even lattice of even rank, bundled as a modular form on `Γ₁(N)`,
`N` the level. Boundedness at *every* cusp comes from the vector-valued transformation law:
each slash of `Θ_L` is a combination of coset theta series, whose `q_N`-expansions are supported
in nonnegative exponents. -/
def thetaFormOfLevel (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L) :
    ModularForm ((Gamma1 (level L)).map (Matrix.SpecialLinearGroup.mapGL ℝ)) (k : ℤ) := sorry

@[simp] theorem coe_thetaFormOfLevel (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L) :
    ⇑(thetaFormOfLevel L k hn he) = thetaSeries L := sorry

/-- **Hecke–Schoeneberg, character-space spelling**: `Θ_L` lies in the `χ_L`-eigenspace of the
diamond operators, Tau Ceti's `modFormCharSpace`, with the character in its unit-homomorphism face
via `MulChar.equivToUnitHom` (the roadmap keeps both faces, as the modular-forms roadmap does).
The `NeZero` instance is supplied by `level_pos he`; the equivalence with the classical spelling
above goes through the landed `mem_modFormCharSpace_iff_nebentypus`. -/
theorem thetaFormOfLevel_mem_modFormCharSpace (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) [NeZero (level L)] :
    thetaFormOfLevel L k hn he ∈
      modFormCharSpace (k : ℤ) (MulChar.equivToUnitHom (discChar L k)) := sorry

end GeneralLevel

/-! ## Layer 6: the classical identifications

The general rank-8 and rank-24 statements come first; `E₈` and Leech are their instances, and the
kissing numbers are corollaries of the instances. ⚠ `240` and `196560` are **outputs**: neither may
appear as a hypothesis, and a proof that computes either by counting has not discharged its
target.

The sphere-packing project's `E8Lattice` and `LeechLattice` are not declarations this repository
can import (see `README.md`, *Provenance*), so every statement below is seeded in **lattice-free
form** — rank plus evenness plus unimodularity, plus rootlessness for rank `24` — with the named
instantiations specified in the README and discharged in Tau Ceti once the lattices land there.
Nothing is lost: the classification of even unimodular lattices in these ranks is out of scope, so
the hypotheses are exactly what the proofs consume. -/

section Identification

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- Every even unimodular lattice of rank `8` has theta series `E₄`. The only input is
`repNum L 0 = 1`: the Sturm bound at weight `4` is `⌊4/12⌋ = 0`. -/
theorem thetaForm_eq_E₄ (hn : Module.finrank ℝ E = 8) (he : IsEven L) (hu : IsUnimodular L) :
    thetaForm L 4 (by omega) he hu = EisensteinSeries.E₄ := sorry

/-- Every even unimodular lattice of rank `24` has theta series `E₄ ^ 3 + (r_L(2) - 720) Δ`. The
Sturm bound at weight `12` is `1`, so the constant term and `r_L(2)` determine the form. -/
theorem thetaForm_rank_24 (hn : Module.finrank ℝ E = 24) (he : IsEven L) (hu : IsUnimodular L) :
    (thetaForm L 12 (by omega) he hu : ℍ → ℂ) =
      fun τ => (EisensteinSeries.E₄ τ) ^ 3 +
        ((repNum L 2 : ℂ) - 720) * ModularForm.discriminant τ := sorry

/-- `r_L(2m) = 240 σ₃(m)` for every even unimodular lattice of rank `8` — in particular for `E₈`,
whose evenness and unimodularity the sphere-packing project has already formalized. A corollary of
`thetaForm_eq_E₄`, `qExpansion_thetaForm_coeff`, and `EisensteinSeries.E_qExpansion_coeff` with
`bernoulli 4 = -1/30`; stated in `ℕ`, since both sides are counts. -/
theorem repNum_rank_eight (hn : Module.finrank ℝ E = 8)
    (he : IsEven L) (hu : IsUnimodular L) {m : ℕ} (hm : m ≠ 0) :
    repNum L (2 * m) = 240 * σ 3 m := sorry

/-- The kissing number of `E₈`, as an **output**: the case `m = 1` of `repNum_rank_eight`, not a
counting argument over the root system. -/
theorem repNum_two_rank_eight (hn : Module.finrank ℝ E = 8)
    (he : IsEven L) (hu : IsUnimodular L) :
    repNum L 2 = 240 := sorry

/-- `Θ_L = E₄ ^ 3 - 720 Δ` for every **rootless** even unimodular lattice of rank `24` — the Leech
identity, whose lattice-specific hypothesis is the sphere-packing project's `leech_rootless`. The
rootless case of `thetaForm_rank_24`. -/
theorem coe_thetaForm_rank_24_rootless (hn : Module.finrank ℝ E = 24)
    (he : IsEven L) (hu : IsUnimodular L) (hr : repNum L 2 = 0) :
    (thetaForm L 12 (by omega) he hu : ℍ → ℂ) =
      fun τ => (EisensteinSeries.E₄ τ) ^ 3 - 720 * ModularForm.discriminant τ := sorry

/-- `r_Λ(2m) = (65520/691) (σ₁₁(m) - τ(m))`, the coefficient form of the equivalent identity
`Θ_Λ = E₁₂ - (65520/691) Δ`. Mathlib has no named Ramanujan `τ`-function, so `τ(m)` is spelled as
what it is: the `m`-th `q`-expansion coefficient of `Δ`. Stated in `ℂ`, where the `q`-expansion
coefficients live; that both sides are rational (indeed, that the right side is a natural number)
is part of the content. -/
theorem repNum_rank_24_rootless (hn : Module.finrank ℝ E = 24)
    (he : IsEven L) (hu : IsUnimodular L) (hr : repNum L 2 = 0) {m : ℕ} (hm : m ≠ 0) :
    (repNum L (2 * m) : ℂ) =
      65520 / 691 * ((σ 11 m : ℂ) - (qExpansion 1 CuspForm.discriminant).coeff m) := sorry

/-- The kissing number of the Leech lattice, as an **output**: the case `m = 2` of
`repNum_rank_24_rootless`, with `σ₁₁(2) = 2049` and `τ(2) = -24`. `196560` appears in no
hypothesis. -/
theorem repNum_four_rank_24_rootless (hn : Module.finrank ℝ E = 24)
    (he : IsEven L) (hu : IsUnimodular L) (hr : repNum L 2 = 0) :
    repNum L 4 = 196560 := sorry

/-- Every even unimodular lattice of rank `16` has theta series `E₄ ^ 2`: at weight `8` the Sturm
bound is again `0`, so `repNum L 0 = 1` is the only input. -/
theorem coe_thetaForm_rank_16 (hn : Module.finrank ℝ E = 16)
    (he : IsEven L) (hu : IsUnimodular L) :
    (thetaForm L 8 (by omega) he hu : ℍ → ℂ) =
      fun τ => (EisensteinSeries.E₄ τ) ^ 2 := sorry

/-- Hence any two even unimodular lattices of rank `16` — `E₈ ⊕ E₈` and `D₁₆⁺` among them — have
*equal* bundled theta series, even across different ambient spaces. -/
theorem thetaForm_rank_16_eq (M : Submodule ℤ F) [DiscreteTopology M] [IsZLattice ℝ M]
    (hnE : Module.finrank ℝ E = 16) (hnF : Module.finrank ℝ F = 16)
    (heL : IsEven L) (huL : IsUnimodular L) (heM : IsEven M) (huM : IsUnimodular M) :
    thetaForm L 8 (by omega) heL huL = thetaForm M 8 (by omega) heM huM := sorry

/-- **The theta series does not determine the lattice** (Witt's example). The witnesses are
`E₈ ⊕ E₈` and `D₁₆⁺` (`README.md`, Layer 6): equal theta series by `thetaForm_rank_16_eq`, and
non-isometric because the sublattice generated by the norm-`2` vectors is everything in the first
and of index `2` in the second — a root-sublattice computation consuming the integral-lattices
`D_n` model, *not* a vector count (both have `480` of them). Isometry is spelled per the README
convention: a real linear isometry of the ambient space carrying one lattice onto the other, here
as an image of sets to keep `ℤ`-`ℝ` scalar bookkeeping out of the statement. -/
theorem exists_thetaSeries_eq_not_isometric :
    ∃ L' M' : Submodule ℤ (EuclideanSpace ℝ (Fin 16)),
      IsEven L' ∧ IsUnimodular L' ∧ IsEven M' ∧ IsUnimodular M' ∧
      thetaSeries L' = thetaSeries M' ∧
      ¬ ∃ e : EuclideanSpace ℝ (Fin 16) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 16),
          e '' (L' : Set (EuclideanSpace ℝ (Fin 16))) =
            (M' : Set (EuclideanSpace ℝ (Fin 16))) := sorry

end Identification

end

end TauCetiRoadmap.ThetaSeries
