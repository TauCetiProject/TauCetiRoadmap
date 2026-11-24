import Mathlib
import TauCeti.Combinatorics.Young.HookLength.Basic
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Basic

/-!
# Deligne–Lusztig theory: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with the few definitions they
need, and names the headline theorems that are not statable at the pins and what each lacks.

`F` is a finite field with `q = Nat.card F` elements and `GL (Fin n) F` is `GL_n(𝔽_q)`.
Representations are Mathlib's `FDRep ℂ (GL (Fin n) F)`, the irreducible ones those that are
`CategoryTheory.Simple`; the upper unitriangular group `U` is Tau Ceti's
`TauCeti.upperUnitriangularGroup (Fin n) F`, and hook lengths are Tau Ceti's
`YoungDiagram.hookLength`.

## Stated here: Layer 2

* §2.1: the parametrisation of the conjugacy classes of `GL_n(𝔽_q)` (`exists_equiv_conjClasses_GL`),
  through the kernel dimensions that determine the Jordan type of the unipotent part in each factor
  of the centraliser of the semisimple part; the number `q^n − q^{n−1}` of semisimple classes
  (`card_semisimple_conjClasses_GL`); the generating function of the number `c_n(q)` of classes
  (`coeff_card_conjClasses_GL_mul_prod`).
* §2.2 (b), (c): every irreducible cuspidal representation is generic of degree `ϖ_{n−1}(q)`
  (`isGeneric_and_finrank_of_isCuspidal`); the cuspidality criterion by the restriction to the
  mirabolic subgroup, through characters (`isCuspidal_iff_character_mirabolic`); the values of
  cuspidal characters at unipotent elements (`character_unipotent_of_isCuspidal`). Cuspidality,
  genericity, `P_n` and `ψ` are written out (`IsCuspidal`, `IsGeneric`, `IsMirabolic`, `stdChar`).
* §2.4: Green's cuspidal characters (`exists_cuspidal_of_regular`). The character `σ_θ` is given by
  its values at every element (`HasCuspidalValues`), which determine a class function.
* §2.7: every irreducible cuspidal character is some `σ_θ` (`exists_regular_of_isCuspidal`), and
  Green's degree formula (`exists_equiv_irreducibleCharacters_GL`).
* §2.9: `⟨Γ_n, Γ_n⟩ = q^n − q^{n−1}` (`gelfandGraevCharacter_pairing_self`, with
  `gelfandGraevCharacter` the induced character of `ψ`) and the number of generic irreducible
  characters (`ncard_generic_characters_GL`).
* §2.10: the bounds `q^n − q^{n−1} ≤ c_n(q) ≤ q^n` (`card_conjClasses_GL_bounds`), the generating
  function (with §2.1), and the numbers of cuspidal and of generic irreducible characters
  (`ncard_cuspidal_characters_GL`, `ncard_generic_characters_GL`). The number of irreducible
  characters is the number `c_n(q)` of conjugacy classes by RepresentationTheory/CharacterTheory
  Layer 2.
* §2.11: Kondo's Gauss sums of the cuspidal characters (`gaussSum_of_hasCuspidalValues`).
* §2.12 (a), (b): the norm map from the `Fr`-conjugacy classes of `GL_n(𝔽_{q^d})` onto the
  conjugacy classes of `GL_n(𝔽_q)` and the count of its fibres (`norm_isConj_bijective`,
  `card_norm_fiber_mul_card`); the isometry of the Shintani lift and its value on `ω∘det`
  (`shintaniLift_isometry`, `shintaniLift_det`), with `frobGL` and `normGL` the entrywise
  `q`-Frobenius and the norm `δ·Fr(δ)⋯Fr^{d−1}(δ)`.
* §2.12 (d): Shintani's lifting theorem (`exists_shintaniCorrespondence`). An extension of a
  representation `W` of `GL_n(𝔽_{q^d})` to `GL_n(𝔽_{q^d}) ⋊ ⟨Fr⟩` is written as the operator `A` by
  which `Fr` acts: `A ∘ W(g) = W(Fr g) ∘ A` and `A^d = 1`; its value at `δ·Fr` is `tr(W(δ) ∘ A)`.

## Not statable at the pins

* Layer 1, all of it. Every section is about the Deligne–Lusztig varieties `Y_U` of a connected
  reductive group with a Frobenius or Steinberg endomorphism, their compactly supported `ℓ`-adic
  cohomology and the virtual characters `R_T^G(θ)` and Green functions defined from it by Lefschetz
  numbers. Compactly supported `ℓ`-adic cohomology with the action of finite groups
  (EtaleCohomologyFoundations §F.2.5) is not at the pins, nor are the rational maximal tori with
  their types (ReductiveGroups §7a.2) and the Harish-Chandra functors (ReductiveGroups Layer 7c).
  Tau Ceti has reductive groups over a field as Hopf algebras (`TauCeti.ReductiveCommHopfAlgCat`)
  and identifies the points fixed by the `q`-Frobenius with the rational points
  (`TauCeti.FiniteField.rationalPointsMulEquiv`), which gives `G^F` for the `q`-Frobenius, but no
  `ℓ`-adic cohomology.
* §2.1: the count of the classes of pairs `(T, θ)` of a rational maximal torus and a character, as
  the rational maximal tori of `GL_n` and their twisted classes are ReductiveGroups' (§7a.2).
* §2.2 (a), the description of the derivatives `π^{(i)}` in (b), and (d): they concern the
  derivative functors `Ψ^±`, `Φ^±` and the Harish-Chandra product `σ × σ`. Mathlib's
  `Representation.ind` induces along a group homomorphism, but the standard parabolic subgroups of
  `GL_n` with their Levi projections, and so Harish-Chandra induction (ReductiveGroups Layer 7c),
  are not at the pins; writing them out here would be a long ad hoc encoding.
* §2.4 and §2.7 in the form of the README: `σ_θ` is `(−1)^{n−1}R_{T_{(n)}}^G(θ)` and the character
  `χ_λ` of a Green datum is `ch_κ(⊗_O s_{λ(O)})`, both defined through Deligne–Lusztig characters.
  The file states `σ_θ` through its values, which determine it, and Green's degree formula as a
  bijection from the irreducible characters onto the Green data carrying the degrees; the bijection
  `λ ↦ χ_λ` itself needs `ch_κ`.
* §2.5: `End_G(R_L^G σ)` and the Iwahori–Hecke algebras `H_m(a)` of TypeAHeckeAlgebras need
  Harish-Chandra induction and those algebras, neither at the pins.
* §§2.6 and 2.8: the characteristic maps `ch_κ`, uniformity, the expansions in the `R_T^G(θ)`, the
  Green functions and the identification of Green's `J_n(θ̃)` (defined by a recursion through
  Harish-Chandra products) all need Deligne–Lusztig characters or Harish-Chandra induction.
* §2.9: the labels and the semisimple characters, defined through the characters `χ_λ` of §2.6, and
  so the degrees of the generic and semisimple characters of a given label.
* §2.10: the number of semisimple irreducible characters, defined through §2.9.
* §2.12 (c), whose `R_M^G` and `R_M^{Fr}` are Harish-Chandra inductions.
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
  (Nat.card (TauCeti.upperUnitriangularGroup (Fin n) F) : ℂ)⁻¹ *
    ∑ᶠ x : GL (Fin n) F,
      if x * g * x⁻¹ ∈ TauCeti.upperUnitriangularGroup (Fin n) F then stdChar ψ₀ (x * g * x⁻¹)
      else 0

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
    ∀ u ∈ TauCeti.upperUnitriangularGroup (Fin n) F, ∀ v : V, l (V.ρ u v) = stdChar ψ₀ u * l v

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
      V.character p = (Nat.card (TauCeti.upperUnitriangularGroup (Fin n) F) : ℂ)⁻¹ *
        ∑ᶠ x : GL (Fin n) F,
          if IsMirabolic x ∧ x * p * x⁻¹ ∈ TauCeti.upperUnitriangularGroup (Fin n) F then
            stdChar ψ₀ (x * p * x⁻¹)
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

/-- §2.4 The values of Green's cuspidal character `σ_θ`, for a character `θ` of the multiplicative
group of an extension `L` of `F`. A function `χ` on `GL_n(F)` has them when, for all commuting `s`,
`u` with `s` semisimple and `u` unipotent: `χ(su) = 0` unless the characteristic polynomial of `s`
is a power of an irreducible polynomial; and if it is `P^{n/d}` with `P` monic irreducible of
degree `d`, then for every root `z ∈ L` of `P`,
`χ(su) = (−1)^{n−1}·(Σ_{j<d} θ(z^{q^j}))·∏_{i=1}^{ℓ−1}(1 − q^{di})`, where `ℓ = dim_F ker(u − 1)/d`
is the number of Jordan blocks of `u` in the centraliser `GL_{n/d}(𝔽_{q^d})` of `s`. Every element
of `GL_n(F)` is such a product `su`, so these values determine a class function. -/
def HasCuspidalValues {L : Type*} [Field L] [Algebra F L] (θ : Lˣ →* ℂˣ)
    (χ : GL (Fin n) F → ℂ) : Prop :=
  ∀ s u : GL (Fin n) F, Commute s u →
    Module.End.IsSemisimple (Matrix.toLin' (s : Matrix (Fin n) (Fin n) F)) →
    IsNilpotent ((u : Matrix (Fin n) (Fin n) F) - 1) →
      ((∀ P : F[X], Irreducible P → ∀ m : ℕ, (s : Matrix (Fin n) (Fin n) F).charpoly ≠ P ^ m) →
          χ (s * u) = 0) ∧
      ∀ (P : F[X]) (z : Lˣ), P.Monic → Irreducible P →
        (s : Matrix (Fin n) (Fin n) F).charpoly = P ^ (n / P.natDegree) →
        aeval (z : L) P = 0 →
        χ (s * u) = (-1) ^ (n - 1) *
          (∑ j ∈ Finset.range P.natDegree, ((θ (z ^ Nat.card F ^ j) : ℂˣ) : ℂ)) *
          ∏ i ∈ Finset.Ico 1 (Module.finrank F
              (LinearMap.ker (Matrix.toLin' ((u : Matrix (Fin n) (Fin n) F) - 1))) / P.natDegree),
            (1 - (Nat.card F : ℂ) ^ (P.natDegree * i))

/-- §2.4 Green's cuspidal characters. Let `L` be an extension of `F` of degree `n ≥ 1` and `θ` a
regular character of `Lˣ`: its `n` Frobenius conjugates `θ, θ^q, …, θ^{q^{n−1}}` are distinct.
There is an irreducible cuspidal representation `σ_θ` of `GL_n(F)` whose character has the values
`HasCuspidalValues θ`; its value at `1`, `ϖ_{n−1}(q)`, is its degree, and at an element whose
characteristic polynomial is irreducible with root `z ∈ L` it is `(−1)^{n−1} Σ_{j<n} θ(z^{q^j})`. -/
theorem exists_cuspidal_of_regular (hn : 1 ≤ n) (L : Type*) [Field L] [Algebra F L]
    (hL : Module.finrank F L = n) (θ : Lˣ →* ℂˣ)
    (hθ : Function.Injective fun j : Fin n => θ ^ Nat.card F ^ (j : ℕ)) :
    ∃ V : FDRep ℂ (GL (Fin n) F), CategoryTheory.Simple V ∧ IsCuspidal V ∧
      HasCuspidalValues θ V.character := by
  sorry

/-- §2.7 Every irreducible cuspidal character is some `σ_θ`. Let `L` be an extension of `F` of
degree `n ≥ 1`. The character of every irreducible cuspidal representation of `GL_n(F)` has the
values `HasCuspidalValues θ` for a regular character `θ` of `Lˣ`. -/
theorem exists_regular_of_isCuspidal (hn : 1 ≤ n) (L : Type*) [Field L] [Algebra F L]
    (hL : Module.finrank F L = n) (V : FDRep ℂ (GL (Fin n) F)) [CategoryTheory.Simple V]
    (hV : IsCuspidal V) :
    ∃ θ : Lˣ →* ℂˣ, (Function.Injective fun j : Fin n => θ ^ Nat.card F ^ (j : ℕ)) ∧
      HasCuspidalValues θ V.character := by
  sorry

/-- §2.7 Green's degree formula. There is a bijection from the irreducible characters of
`GL_n(𝔽_q)` onto the Green data of weight `n` in the labelled form, the functions `λ` from the
monic irreducible polynomials `f ≠ X` over `F` to partitions with `Σ_f deg(f)·|λ(f)| = n` (the
index set of `exists_equiv_conjClasses_GL`), under which the character of `λ` has degree
`ϖ_n(q) ∏_f q_f^{n(λ(f))} / H̃_{λ(f)}(q_f)`, `q_f = q^{deg f}`. The factor of `f` is written cell by
cell of the Young diagram of `λ(f)`: `n(μ)` is the sum of the row indices of the cells and
`H̃_μ(t) = ∏_{cells} (t^{h} − 1)`, `h` the hook length. -/
theorem exists_equiv_irreducibleCharacters_GL :
    ∃ e : {χ : GL (Fin n) F → ℂ //
          ∃ V : FDRep ℂ (GL (Fin n) F), CategoryTheory.Simple V ∧ V.character = χ} ≃
        {μ : {f : F[X] // f.Monic ∧ Irreducible f ∧ f ≠ X} → (Σ k : ℕ, Nat.Partition k) //
          (Function.support fun f => (μ f).1).Finite ∧
            ∑ᶠ f, (μ f).1 * (f : F[X]).natDegree = n},
      ∀ χ, χ.1 1 = (∏ i ∈ Finset.Icc 1 n, ((Nat.card F : ℂ) ^ i - 1)) *
        ∏ᶠ f, ∏ c ∈ (YoungDiagram.ofPartition ((e χ).1 f).2).cells,
          ((Nat.card F : ℂ) ^ (f : F[X]).natDegree) ^ c.1 /
            (((Nat.card F : ℂ) ^ (f : F[X]).natDegree) ^
              YoungDiagram.hookLength (YoungDiagram.ofPartition ((e χ).1 f).2) c - 1) := by
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

/-- §2.11 Kondo's Gauss sums of the cuspidal characters. Let `L` be an extension of `F` of degree
`n ≥ 1`, `θ` a regular character of `Lˣ`, `ψ₀` a nontrivial additive character of `F` and `V` a
representation whose character has the values `HasCuspidalValues θ` of `σ_θ`. The operator
`Σ_x ψ₀(tr x)·x` on `V` is the scalar `(−1)^{n−1} q^{n(n−1)/2} g_n(θ)`, where
`g_n(θ) = Σ_{z ∈ Lˣ} θ(z)ψ₀(Tr_{L/F} z)` is the Gauss sum of `θ` and `ψ₀ ∘ Tr_{L/F}` (Mathlib's
`gaussSum` of the multiplicative character `θ` and the additive character `ψ₀ ∘ Tr_{L/F}`). -/
theorem gaussSum_of_hasCuspidalValues (hn : 1 ≤ n) (L : Type*) [Field L] [Algebra F L]
    (hL : Module.finrank F L = n) (θ : Lˣ →* ℂˣ)
    (hθ : Function.Injective fun j : Fin n => θ ^ Nat.card F ^ (j : ℕ))
    (ψ₀ : AddChar F ℂ) (hψ₀ : ψ₀ ≠ 1) (V : FDRep ℂ (GL (Fin n) F))
    (hV : HasCuspidalValues θ V.character) :
    ∑ᶠ x : GL (Fin n) F, ψ₀ (Matrix.trace (x : Matrix (Fin n) (Fin n) F)) • V.ρ x =
      ((-1) ^ (n - 1) * (Nat.card F : ℂ) ^ (n * (n - 1) / 2) *
          ∑ᶠ z : Lˣ, ((θ z : ℂˣ) : ℂ) * ψ₀ (Algebra.trace F L (z : L))) •
        LinearMap.id := by
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

section ShintaniLifting

variable {F F' : Type} [Field F] [Finite F] [Field F'] [Finite F'] [Algebra F F'] {n : ℕ}

/-- §2.12 (d) Shintani's lifting theorem. There is a bijection `χ ↦ χ′` from the irreducible
characters of `GL_n(F)` onto the irreducible characters of `GL_n(F′)` fixed by `Fr`
(`χ′ ∘ Fr = χ′`, that is `ρ ∘ Fr ≅ ρ`), such that for every `χ` there are a representation `W` of
`GL_n(F′)` with character `χ′`, an operator `A` on `W` with `A ∘ W(g) = W(Fr g) ∘ A` for every `g`
and `A^d = 1`, `d = [F′ : F]` (the extension of `W` to `GL_n(F′) ⋊ ⟨Fr⟩` in which `Fr` acts by
`A`), and a sign `ε = ±1` with `χ(γ) = ε·tr(W(δ) ∘ A)` whenever `Nm(δ)` is conjugate to `γ`: the
Shintani lift of `χ` is `ε` times the character of the extension on the coset `GL_n(F′)·Fr`. -/
theorem exists_shintaniCorrespondence :
    ∃ e : {χ : GL (Fin n) F → ℂ //
          ∃ V : FDRep ℂ (GL (Fin n) F), CategoryTheory.Simple V ∧ V.character = χ} ≃
        {χ' : GL (Fin n) F' → ℂ //
          (∃ W : FDRep ℂ (GL (Fin n) F'), CategoryTheory.Simple W ∧ W.character = χ') ∧
            ∀ g, χ' (frobGL F g) = χ' g},
      ∀ χ, ∃ (W : FDRep ℂ (GL (Fin n) F')) (A : W →ₗ[ℂ] W) (ε : ℂ),
        W.character = (e χ).1 ∧ (∀ g, A ∘ₗ W.ρ g = W.ρ (frobGL F g) ∘ₗ A) ∧
          A ^ Module.finrank F F' = 1 ∧ (ε = 1 ∨ ε = -1) ∧
          ∀ (δ : GL (Fin n) F') (γ : GL (Fin n) F),
            IsConj (normGL F δ) (Matrix.GeneralLinearGroup.map (algebraMap F F') γ) →
              χ.1 γ = ε * LinearMap.trace ℂ W (W.ρ δ ∘ₗ A) := by
  sorry

end ShintaniLifting

end TauCetiRoadmap.DeligneLusztigTheory
