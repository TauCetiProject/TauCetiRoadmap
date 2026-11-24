import Mathlib

/-!
# Deligne–Lusztig theory: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

`F` is a finite field with `q = Nat.card F` elements and `GL (Fin n) F` is `GL_n(𝔽_q)`.
Representations are Mathlib's `FDRep ℂ (GL (Fin n) F)`.

## Layer 1

Nothing in Layer 1 is stated here. Every section of it is about the Deligne–Lusztig varieties
`Y_U` of a connected reductive group with a Frobenius or Steinberg endomorphism, their compactly
supported `ℓ`-adic cohomology and the virtual characters `R_T^G(θ)` and Green functions defined
from it by Lefschetz numbers. Neither these varieties nor their `ℓ`-adic cohomology are in Mathlib
or in Tau Ceti at the pins, nor are the finite reductive groups `G^F`, their rational maximal tori
and the Harish-Chandra functors of ReductiveGroups that the statements are made in, so no headline
statement of §§1.1–1.11 can be written without introducing them.

## Layer 2

* §2.1. Stated: the parametrisation of the conjugacy classes of `GL_n(𝔽_q)`
  (`exists_equiv_conjClasses_GL`), the number `q^n − q^{n−1}` of semisimple classes
  (`card_semisimple_conjClasses_GL`) and the generating function of the number `c_n(q)` of classes
  (`coeff_card_conjClasses_GL_mul_prod`). The parametrisation is stated through the kernel
  dimensions that determine the Jordan type of the unipotent part in each factor of the centraliser
  of the semisimple part. Not statable: the count of the classes of pairs `(T, θ)` of a rational
  maximal torus and a character, as the rational maximal tori of `GL_n` and their twisted classes
  are ReductiveGroups' (§7a.2) and are not in Mathlib.
* §2.2. Stated: from (b), that every cuspidal irreducible representation is generic and has degree
  `ϖ_{n−1}(q)` (`isGeneric_and_finrank_of_isCuspidal`) and the cuspidality criterion by the
  restriction to the mirabolic subgroup, through characters (`isCuspidal_iff_character_mirabolic`);
  and (c) (`character_unipotent_of_isCuspidal`). Cuspidality, genericity, `U`, `P_n` and `ψ` are
  written out (`IsCuspidal`, `IsGeneric`, `IsUpperUnitriangular`, `IsMirabolic`, `stdChar`). Not
  statable: (a) and the description of the derivatives `π^{(i)}` in (b), which are statements about
  the derivative functors `Ψ^±`, `Φ^±`, and (d), which is about the Harish-Chandra product `σ × σ`;
  these functors and Harish-Chandra induction (ReductiveGroups Layer 7c) are not in Mathlib.
* §§2.4–2.8 and §2.11. Not statable: `σ_θ` (§2.4) is `(−1)^{n−1}R_{T_{(n)}}^G(θ)`, the
  characteristic maps `ch_κ` and the characters `χ_λ` (§§2.6–2.8) are defined through the
  `R_T^G(θ)`, Green's `J_n(θ̃)` (§2.8 (b)) through Harish-Chandra products, and the Gauss sums of
  §2.11 are those of the `σ_θ`; §2.5 is about `End_G(R_L^G σ)` and the Iwahori–Hecke algebras
  `H_m(a)` of TypeAHeckeAlgebras. Deligne–Lusztig characters (Layer 1), Harish-Chandra induction
  and the algebras `H_m(a)` are not in Mathlib.
* §2.9. Stated: `⟨Γ_n, Γ_n⟩ = q^n − q^{n−1}` (`gelfandGraevCharacter_pairing_self`, with
  `gelfandGraevCharacter` the induced character of `ψ`) and the number of generic irreducible
  characters (`ncard_generic_characters_GL`). Not statable: the labels, the semisimple characters
  and the degrees, which are defined through the characters `χ_λ` of §2.6.
* §2.10. Stated: the bounds `q^n − q^{n−1} ≤ c_n(q) ≤ q^n` (`card_conjClasses_GL_bounds`), the
  generating function (with §2.1), and the numbers of cuspidal and of generic irreducible
  characters (`ncard_cuspidal_characters_GL`, `ncard_generic_characters_GL`). The number of
  irreducible characters is the number `c_n(q)` of conjugacy classes by
  RepresentationTheory/CharacterTheory Layer 2. Not statable: the number of semisimple irreducible
  characters, which are defined through §2.9.
* §2.12. Stated: (a), the norm map from the `Fr`-conjugacy classes of `GL_n(𝔽_{q^d})` onto the
  conjugacy classes of `GL_n(𝔽_q)` and the count of its fibres (`norm_isConj_bijective`,
  `card_norm_fiber_mul_card`), and (b), the isometry of the Shintani lift and its value on
  `ω∘det` (`shintaniLift_isometry`, `shintaniLift_det`), with `frobGL` and `normGL` the entrywise
  `q`-Frobenius and the norm `δ·Fr(δ)⋯Fr^{d−1}(δ)`. Not statable: (c), whose `R_M^G` and
  `R_M^{Fr}` are Harish-Chandra inductions (ReductiveGroups Layer 7c), and (d), which needs the
  action of `⟨Fr⟩` on `GL_n(𝔽_{q^d})` as a cyclic group of order `d` and the representations of the
  semidirect product; neither is in Mathlib.
-/

open Polynomial

namespace TauCetiRoadmap.DeligneLusztigTheory

/-! ## Layer 2: the characters of `GL_n(𝔽_q)` -/

section Classes

variable {F : Type*} [Field F] [Finite F]

/-- §2.1 The conjugacy classes of `GL_n(𝔽_q)`. They correspond to the functions `μ` from the
monic irreducible polynomials `f ≠ X` over `F` to partitions with `Σ_f deg(f)·|μ(f)| = n`; the
class of `g` has `μ(f)` the Jordan type of the unipotent part of `g` in the factor of `f` of the
centraliser of its semisimple part, equivalently the partition whose parts are the exponents of
the elementary divisors `f^m` of `g`. The kernel of `f(g)^k` then has dimension
`deg f · Σ_i min(μ(f)_i, k)`, which determines `μ(f)`. -/
theorem exists_equiv_conjClasses_GL (n : ℕ) :
    ∃ e : ConjClasses (GL (Fin n) F) ≃
        {μ : {f : F[X] // f.Monic ∧ Irreducible f ∧ f ≠ X} → (Σ k : ℕ, Nat.Partition k) //
          (Function.support fun f => (μ f).1).Finite ∧
            ∑ᶠ f, (μ f).1 * (f : F[X]).natDegree = n},
      ∀ (g : GL (Fin n) F) (f : {f : F[X] // f.Monic ∧ Irreducible f ∧ f ≠ X}) (k : ℕ),
        Module.finrank F (LinearMap.ker
            (aeval (Matrix.toLin' (g : Matrix (Fin n) (Fin n) F)) ((f : F[X]) ^ k))) =
          (f : F[X]).natDegree *
            (((e (ConjClasses.mk g)).1 f).2.parts.map fun i => min i k).sum := by
  sorry

/-- §2.1 The number of semisimple conjugacy classes of `GL_n(𝔽_q)`, `n ≥ 1`, is `q^n − q^{n−1}`:
they are determined by their characteristic polynomials, the monic polynomials of degree `n` with
nonzero constant term. -/
theorem card_semisimple_conjClasses_GL {n : ℕ} (hn : 1 ≤ n) :
    Nat.card {c : ConjClasses (GL (Fin n) F) //
        ∀ g ∈ c.carrier, Module.End.IsSemisimple (Matrix.toLin' (g : Matrix (Fin n) (Fin n) F))} =
      Nat.card F ^ n - Nat.card F ^ (n - 1) := by
  sorry

/-- §§2.1, 2.10 The generating function `Σ_{n≥0} c_n(q) t^n = ∏_{i≥1} (1 − t^i)/(1 − q t^i)` of
the number `c_n(q)` of conjugacy classes of `GL_n(𝔽_q)`, coefficient by coefficient: the factors
with `i > N` do not change the coefficient of `t^N`. -/
theorem coeff_card_conjClasses_GL_mul_prod (N : ℕ) :
    PowerSeries.coeff N
        (PowerSeries.mk (fun n => (Nat.card (ConjClasses (GL (Fin n) F)) : ℤ)) *
          ∏ i ∈ Finset.Icc 1 N, (1 - (Nat.card F : PowerSeries ℤ) * PowerSeries.X ^ i)) =
      PowerSeries.coeff N (∏ i ∈ Finset.Icc 1 N, (1 - PowerSeries.X ^ i : PowerSeries ℤ)) := by
  sorry

/-- §2.10 For `n ≥ 1`, `q^n − q^{n−1} ≤ c_n(q) ≤ q^n`: the lower bound counts the semisimple
classes, the upper bound is Maslen–Rockmore's. -/
theorem card_conjClasses_GL_bounds {n : ℕ} (hn : 1 ≤ n) :
    Nat.card F ^ n - Nat.card F ^ (n - 1) ≤ Nat.card (ConjClasses (GL (Fin n) F)) ∧
      Nat.card (ConjClasses (GL (Fin n) F)) ≤ Nat.card F ^ n := by
  sorry

end Classes

section Representations

variable {F : Type} [Field F] [Finite F] {n : ℕ}

/-- The upper unitriangular group `U` of `GL_n(𝔽_q)`. -/
def IsUpperUnitriangular (u : GL (Fin n) F) : Prop :=
  ∀ i j, j ≤ i → (u : Matrix (Fin n) (Fin n) F) i j = if i = j then 1 else 0

/-- The mirabolic subgroup `P_n` of `GL_n(𝔽_q)`: the matrices with last row `(0, …, 0, 1)`. -/
def IsMirabolic (p : GL (Fin n) F) : Prop :=
  ∀ i j : Fin n, (i : ℕ) + 1 = n → (p : Matrix (Fin n) (Fin n) F) i j = if i = j then 1 else 0

/-- The standard regular character `ψ(u) = ψ₀(u₁₂ + ⋯ + u_{n−1,n})` of `U`, for an additive
character `ψ₀` of `F`. -/
def stdChar (ψ₀ : AddChar F ℂ) (u : GL (Fin n) F) : ℂ :=
  ψ₀ (∑ i : Fin n, ∑ j : Fin n, if (j : ℕ) = i + 1 then (u : Matrix (Fin n) (Fin n) F) i j else 0)

open scoped Classical in
/-- The character of the Gelfand–Graev representation `Γ_n = Ind_U^G ψ`, by the induced-character
formula `Γ_n(g) = |U|⁻¹ Σ_{x ∈ G, xgx⁻¹ ∈ U} ψ(xgx⁻¹)`. -/
noncomputable def gelfandGraevCharacter (ψ₀ : AddChar F ℂ) (g : GL (Fin n) F) : ℂ :=
  (Nat.card {u : GL (Fin n) F // IsUpperUnitriangular u} : ℂ)⁻¹ *
    ∑ᶠ x : GL (Fin n) F,
      if IsUpperUnitriangular (x * g * x⁻¹) then stdChar ψ₀ (x * g * x⁻¹) else 0

/-- Cuspidality (§2.2, after ReductiveGroups §7h.1): the Harish-Chandra restriction to every
proper standard Levi subgroup vanishes, that is, no nonzero vector is fixed by the unipotent
radical of a proper standard parabolic subgroup. A standard parabolic subgroup is given by a
monotone block index `b : Fin n → ℕ` (its blocks are the level sets), and it is proper when `b` is
not constant; its unipotent radical consists of the `g` with `g i j = δ_{ij}` unless the block of
`i` precedes that of `j`. -/
def IsCuspidal (V : FDRep ℂ (GL (Fin n) F)) : Prop :=
  ∀ b : Fin n → ℕ, Monotone b → (∃ i j, b i ≠ b j) → ∀ v : V,
    (∀ g : GL (Fin n) F,
      (∀ i j, b i < b j ∨ (g : Matrix (Fin n) (Fin n) F) i j = if i = j then 1 else 0) →
        V.ρ g v = v) → v = 0

/-- Genericity (§2.2) for the standard regular character `ψ` of `U`, `ψ₀` a nontrivial additive
character of `F`: there is a nonzero linear form `λ` with `λ(u·v) = ψ(u)λ(v)` for `u ∈ U`, that is
`Hom_U(V, ψ) ≠ 0`. -/
def IsGeneric (ψ₀ : AddChar F ℂ) (V : FDRep ℂ (GL (Fin n) F)) : Prop :=
  ∃ l : V →ₗ[ℂ] ℂ, l ≠ 0 ∧
    ∀ u : GL (Fin n) F, IsUpperUnitriangular u → ∀ v : V, l (V.ρ u v) = stdChar ψ₀ u * l v

/-- §2.2 (b) Every irreducible cuspidal representation of `GL_n(𝔽_q)` is generic and has degree
`ϖ_{n−1}(q) = ∏_{i=1}^{n−1} (q^i − 1)`. -/
theorem isGeneric_and_finrank_of_isCuspidal (ψ₀ : AddChar F ℂ) (hψ₀ : ψ₀ ≠ 1)
    (V : FDRep ℂ (GL (Fin n) F)) [CategoryTheory.Simple V] (hV : IsCuspidal V) :
    IsGeneric ψ₀ V ∧
      (Module.finrank ℂ V : ℤ) = ∏ i ∈ Finset.Icc 1 (n - 1), ((Nat.card F : ℤ) ^ i - 1) := by
  sorry

open scoped Classical in
/-- §2.2 (b) The cuspidality criterion by the restriction to the mirabolic subgroup: for `n ≥ 1`
an irreducible representation is cuspidal exactly when its restriction to `P_n` is
`Ind_U^{P_n} ψ`, compared here through characters by the induced-character formula
`|U|⁻¹ Σ_{x ∈ P_n, xpx⁻¹ ∈ U} ψ(xpx⁻¹)`. -/
theorem isCuspidal_iff_character_mirabolic (hn : 1 ≤ n) (ψ₀ : AddChar F ℂ) (hψ₀ : ψ₀ ≠ 1)
    (V : FDRep ℂ (GL (Fin n) F)) [CategoryTheory.Simple V] :
    IsCuspidal V ↔ ∀ p : GL (Fin n) F, IsMirabolic p →
      V.character p = (Nat.card {u : GL (Fin n) F // IsUpperUnitriangular u} : ℂ)⁻¹ *
        ∑ᶠ x : GL (Fin n) F,
          if IsMirabolic x ∧ IsUpperUnitriangular (x * p * x⁻¹) then stdChar ψ₀ (x * p * x⁻¹)
          else 0 := by
  sorry

/-- §2.2 (c) The values of a cuspidal character at unipotent elements: at a unipotent `u` with
`ℓ` Jordan blocks (`ℓ = dim ker(u − 1)`, the number of parts of its Jordan type),
`π(u) = (−1)^{n−ℓ} ∏_{i=1}^{ℓ−1} (q^i − 1)`. -/
theorem character_unipotent_of_isCuspidal (V : FDRep ℂ (GL (Fin n) F)) [CategoryTheory.Simple V]
    (hV : IsCuspidal V) (u : GL (Fin n) F)
    (hu : IsNilpotent ((u : Matrix (Fin n) (Fin n) F) - 1)) :
    V.character u =
      (-1) ^ (n - Module.finrank F (LinearMap.ker (Matrix.toLin' ((u : Matrix (Fin n) (Fin n) F) - 1)))) *
        ∏ i ∈ Finset.Icc 1
            (Module.finrank F (LinearMap.ker (Matrix.toLin' ((u : Matrix (Fin n) (Fin n) F) - 1))) - 1),
          ((Nat.card F : ℂ) ^ i - 1) := by
  sorry

/-- §2.9 `⟨Γ_n, Γ_n⟩ = q^n − q^{n−1}` for `n ≥ 1`, the number of generic irreducible
representations and of semisimple classes. -/
theorem gelfandGraevCharacter_pairing_self (hn : 1 ≤ n) (ψ₀ : AddChar F ℂ) (hψ₀ : ψ₀ ≠ 1) :
    (Nat.card (GL (Fin n) F) : ℂ)⁻¹ *
        ∑ᶠ g : GL (Fin n) F, gelfandGraevCharacter ψ₀ g * gelfandGraevCharacter ψ₀ g⁻¹ =
      ((Nat.card F ^ n - Nat.card F ^ (n - 1) : ℕ) : ℂ) := by
  sorry

/-- §2.10 For `n ≥ 1` the number of cuspidal irreducible characters of `GL_n(𝔽_q)` is
`N*_q(n)`, the number of monic irreducible polynomials of degree `n` over `F` other than `X`. -/
theorem ncard_cuspidal_characters_GL (hn : 1 ≤ n) :
    {χ : GL (Fin n) F → ℂ |
        ∃ V : FDRep ℂ (GL (Fin n) F), CategoryTheory.Simple V ∧ IsCuspidal V ∧
          V.character = χ}.ncard =
      Nat.card {f : F[X] // f.Monic ∧ Irreducible f ∧ f.natDegree = n ∧ f ≠ X} := by
  sorry

/-- §§2.9, 2.10 For `n ≥ 1` the number of generic irreducible characters of `GL_n(𝔽_q)` is
`q^n − q^{n−1}`. -/
theorem ncard_generic_characters_GL (hn : 1 ≤ n) (ψ₀ : AddChar F ℂ) (hψ₀ : ψ₀ ≠ 1) :
    {χ : GL (Fin n) F → ℂ |
        ∃ V : FDRep ℂ (GL (Fin n) F), CategoryTheory.Simple V ∧ IsGeneric ψ₀ V ∧
          V.character = χ}.ncard =
      Nat.card F ^ n - Nat.card F ^ (n - 1) := by
  sorry

end Representations

section Shintani

variable {F F' : Type*} [Field F] [Finite F] [Field F'] [Finite F'] [Algebra F F'] {n : ℕ}

variable (F) in
/-- The automorphism `Fr` of `GL_n(F′)` raising every entry to the `q`-th power, `q = Nat.card F`. -/
noncomputable def frobGL : GL (Fin n) F' →* GL (Fin n) F' :=
  letI := Fintype.ofFinite F
  Matrix.GeneralLinearGroup.map (FiniteField.frobeniusAlgHom F F').toRingHom

variable (F) in
/-- The norm `Nm(δ) = δ·Fr(δ)⋯Fr^{d−1}(δ)`, `d = [F′ : F]`. -/
noncomputable def normGL (δ : GL (Fin n) F') : GL (Fin n) F' :=
  ((List.range (Module.finrank F F')).map fun i => (frobGL F)^[i] δ).prod

/-- §2.12 (a) Norm classes. For `δ ∈ GL_n(F′)`, `Nm(δ)` is conjugate in `GL_n(F′)` to an element of
`GL_n(F)`; elements of `GL_n(F)` conjugate in `GL_n(F′)` are conjugate in `GL_n(F)`; every class of
`GL_n(F)` is a norm class; and two elements of `GL_n(F′)` are `Fr`-conjugate, `δ′ = y⁻¹δFr(y)`,
exactly when they have the same norm class. So the norm class is a bijection from the
`Fr`-conjugacy classes of `GL_n(F′)` onto the conjugacy classes of `GL_n(F)`. -/
theorem norm_isConj_bijective :
    (∀ δ : GL (Fin n) F', ∃ γ : GL (Fin n) F,
        IsConj (normGL F δ) (Matrix.GeneralLinearGroup.map (algebraMap F F') γ)) ∧
      (∀ γ γ' : GL (Fin n) F,
        IsConj (Matrix.GeneralLinearGroup.map (algebraMap F F') γ)
          (Matrix.GeneralLinearGroup.map (algebraMap F F') γ') → IsConj γ γ') ∧
      (∀ γ : GL (Fin n) F, ∃ δ : GL (Fin n) F',
        IsConj (normGL F δ) (Matrix.GeneralLinearGroup.map (algebraMap F F') γ)) ∧
      (∀ δ δ' : GL (Fin n) F',
        (∃ y : GL (Fin n) F', δ' = y⁻¹ * δ * frobGL F y) ↔
          ∃ γ : GL (Fin n) F,
            IsConj (normGL F δ) (Matrix.GeneralLinearGroup.map (algebraMap F F') γ) ∧
              IsConj (normGL F δ') (Matrix.GeneralLinearGroup.map (algebraMap F F') γ)) := by
  sorry

/-- §2.12 (a) The fibres of the norm: `#{δ ∈ GL_n(F′) : Nm(δ) ∼ γ}·|GL_n(F)| =
#(class of γ)·|GL_n(F′)|`. -/
theorem card_norm_fiber_mul_card (γ : GL (Fin n) F) :
    Nat.card {δ : GL (Fin n) F' //
        IsConj (normGL F δ) (Matrix.GeneralLinearGroup.map (algebraMap F F') γ)} *
        Nat.card (GL (Fin n) F) =
      Nat.card {γ' : GL (Fin n) F // IsConj γ γ'} * Nat.card (GL (Fin n) F') := by
  sorry

/-- §2.12 (b) The Shintani lift is an isometry. For class functions `f`, `f′` on `GL_n(F)` and
their lifts `L = Sh_d f`, `L′ = Sh_d f′` (`L(δ) = f(γ)` for `γ` in the norm class of `δ`),
`|GL_n(F′)|⁻¹ Σ_δ L(δ)·conj(L′(δ)) = |GL_n(F)|⁻¹ Σ_γ f(γ)·conj(f′(γ))`. -/
theorem shintaniLift_isometry (f f' : GL (Fin n) F → ℂ) (hf : ∀ g h, IsConj g h → f g = f h)
    (hf' : ∀ g h, IsConj g h → f' g = f' h) (L L' : GL (Fin n) F' → ℂ)
    (hL : ∀ δ γ, IsConj (normGL F δ) (Matrix.GeneralLinearGroup.map (algebraMap F F') γ) →
      L δ = f γ)
    (hL' : ∀ δ γ, IsConj (normGL F δ) (Matrix.GeneralLinearGroup.map (algebraMap F F') γ) →
      L' δ = f' γ) :
    (Nat.card (GL (Fin n) F') : ℂ)⁻¹ * ∑ᶠ δ : GL (Fin n) F', L δ * starRingEnd ℂ (L' δ) =
      (Nat.card (GL (Fin n) F) : ℂ)⁻¹ * ∑ᶠ γ : GL (Fin n) F, f γ * starRingEnd ℂ (f' γ) := by
  sorry

/-- §2.12 (b) `Sh_d(ω∘det) = (ω∘N_{F′/F})∘det` for every character `ω` of `F^×`: if `γ` is in the
norm class of `δ`, then `ω(det γ) = ω(N_{F′/F}(det δ))`. -/
theorem shintaniLift_det (ω : MulChar F ℂ) (δ : GL (Fin n) F') (γ : GL (Fin n) F)
    (h : IsConj (normGL F δ) (Matrix.GeneralLinearGroup.map (algebraMap F F') γ)) :
    ω (Matrix.det (γ : Matrix (Fin n) (Fin n) F)) =
      ω (Algebra.norm F (Matrix.det (δ : Matrix (Fin n) (Fin n) F'))) := by
  sorry

end Shintani

end TauCetiRoadmap.DeligneLusztigTheory
