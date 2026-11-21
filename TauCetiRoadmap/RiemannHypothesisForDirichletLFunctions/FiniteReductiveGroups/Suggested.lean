import Mathlib
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperUnitriangular.Basic

/-!
# Finite reductive groups and the characters of `GL_n(𝔽_q)`: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti where they are
statable, and says for the others which carriers are missing.

The headline statements about `GL_n(𝔽_q)` alone are statable with Mathlib's finite-dimensional
complex representations (`FDRep`, `Representation.IsIrreducible`, `FDRep.character`) and Tau Ceti's
upper unitriangular group `TauCeti.upperUnitriangularGroup`, with four definitions that have native
bodies: `IsCuspidal` (no nonzero vector fixed by the unipotent radical of a standard maximal
parabolic subgroup, which is cuspidality by 1.1), `HasCuspidalValues` (the character values of
Green's cuspidal character `σ_θ`, 5.2, at every element `su`), and the Bessel-type character
`besselCharacter` and the characters `degenerateCharacter` of the degenerate Gelfand–Graev
representations (2.6 (c), 2.7 (b)). Stated here:

* Green's cuspidal characters (5.2): `exists_cuspidal_of_regular`.
* Every irreducible cuspidal character is some `σ_θ` (5.5): `exists_regular_of_isCuspidal`. As
  `HasCuspidalValues θ` fixes a character at every element, the two theorems together identify the
  cuspidal representations with the `σ_θ`.
* The Bessel-type decomposition (2.7 (b)), in its character form: `bessel_pairing_eq`.

The other headline theorems are not statable at the pins.

* The Deligne–Lusztig package (4.4, 4.7, 4.8, 4.9, 4.3): for a connected reductive group `G` over
  `𝔽_q` with Frobenius `F`, a rational maximal torus `T` and a character `θ` of `T^F`, the inner
  product formula for the virtual characters `R_T^G(θ)`, their degree `ε_Gε_T|G^F|_{p'}/|T^F|`,
  irreducibility and cuspidality for `θ` in general position, the disjointness of Lusztig series,
  exhaustion and the character formula through Green functions. It lacks compactly supported
  `ℓ`-adic cohomology of varieties over `𝔽̄_p` with the action of finite groups
  (EtaleCohomologyFoundations §F.2.5), hence the Deligne–Lusztig varieties and the characters
  `R_T^G(θ)`, and the rational maximal tori of `G` with their types (ReductiveGroups Layers 7, 7a).
  Tau Ceti has reductive group schemes over a field as Hopf algebras (`TauCeti.ReductiveCommHopfAlgCat`)
  and identifies their Frobenius-fixed points with their rational points
  (`TauCeti.FiniteField.rationalPointsMulEquiv`), which gives the finite group `G^F`, but no
  `ℓ`-adic cohomology.
* Gelfand–Graev multiplicity one (2.2) and the pairing `⟨Γ_ψ, R_T^G(θ)⟩ = ε_Gε_T` (4.11) for every
  connected reductive `G`: besides `R_T^G(θ)`, it lacks a rational Borel subgroup `B₀ = T₀U₀` of `G`
  with the root subgroups of `U₀` (ReductiveGroups Layers 7C, 9), hence the subgroup `U₀*` and the
  regular characters of `U₀^F`; Tau Ceti has root subgroups only for special linear and a few other
  explicit groups.
* Green's parametrisation and degree formula (5.4, 5.5), the uniqueness of the generic constituent of
  each series (5.4 (c)) and the Gelfand–Graev weights (5.8): the irreducible characters `χ_λ` are
  defined by the characteristic map `ch_m`, which sends power sums to the virtual characters
  `R_T^G(θ)` (5.4); without these the parametrisation is only a bijection with Green data carrying
  the degree formula, a weaker statement, and the series idempotents `z_m` of the weights are
  defined through it.
* The derivatives of the Gelfand–Graev representation (2.7 (a)) and the multiplicities of the
  Bessel-type characters in Harish-Chandra induced cuspidal representations (2.8): they lack the
  mirabolic functors `Φ^±`, `Ψ^±` of 2.4 and Harish-Chandra induction from the standard Levi
  subgroups of `GL_n` (ReductiveGroups Layer 7c); writing these here would be a long ad hoc encoding.
* Shintani descent in prime degree (5.11 (d), (e)): it lacks the twisted characters of
  `GL_m(𝔽_{q^l}) ⋊ ⟨F⟩`, the cuspidal characters over `𝔽_{q^l}` as representations, and the
  Harish-Chandra products of 5.11 (d) for `l ∣ m`.
* Depth-zero supercuspidal representations of `GL_n(F)` and their parametrisation (6.1, 6.2), and
  the labels of depth-zero representations (6.3): they lack smooth representations of `GL_n(F)` for
  a nonarchimedean local field `F` with compact induction, supercuspidality and supercuspidal
  support (SmoothRepresentationsOfLocalGroups SR.2–SR.3).

Deliberately not stated: the case `G = GL_n` of Gelfand–Graev multiplicity one (2.2), which is
statable with Mathlib's characters and the upper unitriangular group but is a weaker case of the
headline for every connected reductive `G`; and the separation of the `σ_θ` by their values at
regular elliptic elements (5.2), a step towards 5.5 and 5.10 rather than a headline.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.FiniteReductiveGroups

open Matrix

variable {K : Type*} [Field K]

/-! ## Layer 2: Gelfand–Graev representations, the mirabolic subgroup and Bessel-type induced representations -/

/-- The Bessel-type character `ϕ_i` of 2.7 (b), for `0 ≤ i`, a block of size `k` and `n`, in `0`-based
indices: `g ↦ ψ₀(Σ g_{ab})` over the pairs `(a, b)` of the block `{i, …, i + k − 1}` with `b = a + 1`, of the chain
`0 → 1 → ⋯ → i − 1 → i + k → i + k + 1 → ⋯ → n − 1` and of no other position. On the subgroup `H_i` of 2.7 (b) it is a
character. -/
noncomputable def besselCharacter (ψ₀ : AddChar K ℂ) (n k i : ℕ) (g : GL (Fin n) K) : ℂ :=
  ψ₀ (∑ a : Fin n, ∑ b : Fin n,
    if ((b : ℕ) = a + 1 ∧ i ≤ (a : ℕ) ∧ (b : ℕ) < i + k) ∨ ((b : ℕ) = a + 1 ∧ (b : ℕ) < i) ∨
        ((a : ℕ) + 1 = i ∧ (b : ℕ) = i + k) ∨ ((b : ℕ) = a + 1 ∧ i + k ≤ (a : ℕ))
    then (g : Matrix (Fin n) (Fin n) K) a b else 0)

/-- The character `ψ_{(j, n − j)}` of the upper unitriangular group defining the degenerate Gelfand–Graev
representation `Γ_{(j, n − j)}` of 2.6 (c), in `0`-based indices: `g ↦ ψ₀(Σ g_{a, a+1})` over the `a` with `a + 1 ≠ j`.
For `j = 0` it is the standard regular character `ψ` of the Conventions. -/
noncomputable def degenerateCharacter (ψ₀ : AddChar K ℂ) (n j : ℕ) (g : GL (Fin n) K) : ℂ :=
  ψ₀ (∑ a : Fin n, ∑ b : Fin n,
    if (b : ℕ) = a + 1 ∧ (b : ℕ) ≠ j then (g : Matrix (Fin n) (Fin n) K) a b else 0)

/-- **The Bessel-type decomposition** (2.7 (b)), in its character form. Let `n ≥ 2`, `1 ≤ k ≤ n − 1`,
`0 ≤ i ≤ n − k − 1`, `U` the upper unitriangular subgroup of `GL_n(K)` and `H_i ⊂ U` the subgroup of index `q^k` whose
column `i + k` (`0`-based) vanishes in the rows `i, …, i + k − 1`. For every class function `χ` of `GL_n(K)`,
`⟨χ|_{H_i}, ϕ_i⟩ = ⟨χ|_U, ψ_{(k, n−k)}⟩ + Σ_{j<k} (q^{k−j} − q^{k−j−1})·⟨χ|_U, ψ_{(j, n−j)}⟩`, the pairings being
`⟨f, φ⟩_H = |H|⁻¹ Σ_{h ∈ H} f(h) φ(h⁻¹)`; by Frobenius reciprocity this is
`Ind_{H_i}^{GL_n(K)} ϕ_i ≅ Γ_{(k,n−k)} ⊕ ⊕_{j=1}^{k−1} (q^{k−j} − q^{k−j−1})·Γ_{(j,n−j)} ⊕ (q^k − q^{k−1})·Γ_n`. There is no
hypothesis on `q`. -/
theorem bessel_pairing_eq [Finite K] (n k i : ℕ) (hk : 1 ≤ k) (hi : i + k < n) (ψ₀ : AddChar K ℂ)
    (hψ₀ : ψ₀ ≠ 1) (χ : GL (Fin n) K → ℂ) (hχ : ∀ g h : GL (Fin n) K, χ (h * g * h⁻¹) = χ g) :
    (Nat.card {h : GL (Fin n) K // h ∈ TauCeti.upperUnitriangularGroup (Fin n) K ∧
        ∀ a b : Fin n, i ≤ (a : ℕ) → (a : ℕ) < i + k → (b : ℕ) = i + k →
          (h : Matrix (Fin n) (Fin n) K) a b = 0} : ℂ)⁻¹ *
      ∑ᶠ (h : GL (Fin n) K) (_ : h ∈ TauCeti.upperUnitriangularGroup (Fin n) K ∧
          ∀ a b : Fin n, i ≤ (a : ℕ) → (a : ℕ) < i + k → (b : ℕ) = i + k →
            (h : Matrix (Fin n) (Fin n) K) a b = 0),
        χ h * besselCharacter ψ₀ n k i h⁻¹ =
    (Nat.card (TauCeti.upperUnitriangularGroup (Fin n) K) : ℂ)⁻¹ *
        ∑ᶠ u ∈ TauCeti.upperUnitriangularGroup (Fin n) K, χ u * degenerateCharacter ψ₀ n k u⁻¹ +
      ∑ j ∈ Finset.range k, ((Nat.card K : ℂ) ^ (k - j) - (Nat.card K : ℂ) ^ (k - j - 1)) *
        ((Nat.card (TauCeti.upperUnitriangularGroup (Fin n) K) : ℂ)⁻¹ *
          ∑ᶠ u ∈ TauCeti.upperUnitriangularGroup (Fin n) K, χ u * degenerateCharacter ψ₀ n j u⁻¹) := by
  sorry

/-! ## Layer 5: Green's theory of `GL_n(𝔽_q)` -/

/-- A representation of `GL_n(K)` is cuspidal when, for every `0 < k < n`, it has no nonzero vector fixed by the
unipotent radical of the standard parabolic subgroup of type `(k, n − k)`, the matrices `1 + X` with `X` supported on
the rows `< k` and the columns `≥ k` (`0`-based). Every proper parabolic subgroup lies in a maximal one, and every
maximal one is conjugate to one of these, so this is the cuspidality of 1.1. -/
def IsCuspidal {n : ℕ} {V : Type*} [AddCommGroup V] [Module ℂ V]
    (ρ : Representation ℂ (GL (Fin n) K) V) : Prop :=
  ∀ k : ℕ, 0 < k → k < n → ∀ v : V,
    (∀ g : GL (Fin n) K, (∀ a b : Fin n, (a = b → (g : Matrix (Fin n) (Fin n) K) a b = 1) ∧
        (a ≠ b → ¬((a : ℕ) < k ∧ k ≤ (b : ℕ)) → (g : Matrix (Fin n) (Fin n) K) a b = 0)) → ρ g v = v) →
      v = 0

/-- The values of Green's cuspidal character `σ_θ` (5.2), for a character `θ` of the multiplicative group of an
extension `L` of `K`. A function `χ` on `GL_n(K)` has them when, for all commuting `s`, `u` with `s` of order prime to
the characteristic and `u` unipotent: `χ(su) = 0` unless the characteristic polynomial of `s` is a power of an
irreducible polynomial; and if it is `P^{n/d}` with `P` monic irreducible of degree `d`, then for every root `z ∈ L` of `P`,
`χ(su) = (−1)^{n−1}·(Σ_{j<d} θ(z^{q^j}))·∏_{i=1}^{ℓ−1}(1 − q^{di})`, where `ℓ = dim_K ker(u − 1)/d` is the number of Jordan
blocks of `u` in the centraliser `GL_{n/d}(𝔽_{q^d})` of `s`. -/
def HasCuspidalValues {n : ℕ} {L : Type*} [Field L] [Algebra K L] (θ : Lˣ →* ℂˣ)
    (χ : GL (Fin n) K → ℂ) : Prop :=
  ∀ s u : GL (Fin n) K, Commute s u → Nat.Coprime (orderOf s) (ringChar K) →
    IsNilpotent ((u : Matrix (Fin n) (Fin n) K) - 1) →
      ((∀ P : Polynomial K, Irreducible P → ∀ m : ℕ, (s : Matrix (Fin n) (Fin n) K).charpoly ≠ P ^ m) →
          χ (s * u) = 0) ∧
      ∀ (P : Polynomial K) (z : Lˣ), P.Monic → Irreducible P →
        (s : Matrix (Fin n) (Fin n) K).charpoly = P ^ (n / P.natDegree) →
        Polynomial.aeval (z : L) P = 0 →
        χ (s * u) = (-1) ^ (n - 1) *
          (∑ j ∈ Finset.range P.natDegree, ((θ (z ^ Nat.card K ^ j) : ℂˣ) : ℂ)) *
          ∏ i ∈ Finset.Ico 1 (Module.finrank K
              (LinearMap.ker (Matrix.toLin' ((u : Matrix (Fin n) (Fin n) K) - 1))) / P.natDegree),
            (1 - (Nat.card K : ℂ) ^ (P.natDegree * i))

/-- **Green's cuspidal characters** (5.2). Let `L` be an extension of `K` of degree `n ≥ 1` and `θ` a character of `Lˣ`
whose `n` Frobenius conjugates `θ, θ^q, …, θ^{q^{n−1}}` are distinct. There is an irreducible cuspidal complex
representation `σ_θ` of `GL_n(K)` of dimension `(q − 1)(q² − 1)⋯(q^{n−1} − 1)` whose character has the values of
`HasCuspidalValues`; at an element whose characteristic polynomial is irreducible with root `z ∈ L` the value is
`(−1)^{n−1}(θ(z) + θ(z^q) + ⋯ + θ(z^{q^{n−1}}))`. -/
theorem exists_cuspidal_of_regular [Finite K] {n : ℕ} (hn : 0 < n) (L : Type*) [Field L] [Finite L] [Algebra K L]
    (hL : Module.finrank K L = n) (θ : Lˣ →* ℂˣ)
    (hθ : Function.Injective fun j : Fin n => θ ^ Nat.card K ^ (j : ℕ)) :
    ∃ V : FDRep ℂ (GL (Fin n) K), Representation.IsIrreducible V.ρ ∧ IsCuspidal V.ρ ∧
      Module.finrank ℂ V = ∏ i ∈ Finset.Ico 1 n, (Nat.card K ^ i - 1) ∧
      HasCuspidalValues θ V.character := by
  sorry

/-- **Every cuspidal character is some `σ_θ`** (5.5). Let `L` be an extension of `K` of degree `n ≥ 1`. The character of
every irreducible cuspidal complex representation of `GL_n(K)` has the values of `HasCuspidalValues` for a character
`θ` of `Lˣ` whose `n` Frobenius conjugates are distinct; as these values determine a class function on `GL_n(K)`, the
representation is `σ_θ`. -/
theorem exists_regular_of_isCuspidal [Finite K] {n : ℕ} (hn : 0 < n) (L : Type*) [Field L] [Finite L]
    [Algebra K L]
    (hL : Module.finrank K L = n) (V : FDRep ℂ (GL (Fin n) K)) (hV : Representation.IsIrreducible V.ρ)
    (hc : IsCuspidal V.ρ) :
    ∃ θ : Lˣ →* ℂˣ, (Function.Injective fun j : Fin n => θ ^ Nat.card K ^ (j : ℕ)) ∧
      HasCuspidalValues θ V.character := by
  sorry

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.FiniteReductiveGroups
