import Mathlib
import TauCeti.RepresentationTheory.CharacterTable.Table

/-!
# Glauberman's Z* theorem: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the one
definition needed to state the principal-block headline. The headlines are Glauberman's Z*
theorem in its isolated-involution form (`glauberman_zStar`) and in its Sylow weak-closure form
(`glauberman_zStar_sylow`), the Brauer–Suzuki theorem for generalized quaternion Sylow
`2`-subgroups (`brauer_suzuki`), and the constancy of principal-`2`-block characters on the odd
part of an involution section (`principalBlock_involution_section_constancy`). Every headline of
the roadmap is statable at the pins; none is missing.

The conclusion of the three group-theoretic headlines is the self-contained existence form of
`t ∈ Z*(G)`: a normal subgroup of odd order containing every commutator `g t g⁻¹ t⁻¹`. The README
(Layer 1) proves it equivalent to centrality of `t` modulo the `2'`-core of
LocalFiniteGroupTheory; stating it this way keeps the file independent of that roadmap's
declarations.
-/

namespace TauCetiRoadmap.GlaubermanZStar

universe u

variable {G : Type u} [Group G] [Finite G]

/-- **Glauberman's Z* theorem** (Glauberman, *Central elements in core-free groups*, 1966,
Theorem 1, in the commuting-conjugate form). If an involution `t` of a finite group `G` is
isolated, that is, the only conjugate of `t` commuting with `t` is `t` itself, then there is a
normal subgroup `N` of odd order such that every commutator `g t g⁻¹ t⁻¹` lies in `N`; equivalently
`t` is central in `G ⧸ O_{2'}(G)`. -/
theorem glauberman_zStar (t : G) (ht : orderOf t = 2)
    (hisolated : ∀ g : G,
      (g * t * g⁻¹) * t = t * (g * t * g⁻¹) → g * t * g⁻¹ = t) :
    ∃ N : Subgroup G, N.Normal ∧ Odd (Nat.card N) ∧
      ∀ g : G, g * t * g⁻¹ * t⁻¹ ∈ N := sorry

/-- **Glauberman's Z* theorem, Sylow form.** If an involution `t` lying in a Sylow `2`-subgroup
`S` is weakly closed in `S` as a singleton, that is, `t` is the only conjugate of `t` lying in `S`,
then the existence form of `t ∈ Z*(G)` holds. Layer 0 of the README proves this hypothesis
equivalent to isolation (Guralnick–Tong-Viet–Tracey, Theorem 5.1 (i) ⇔ (ii)). -/
theorem glauberman_zStar_sylow (S : Sylow 2 G) (t : G)
    (htS : t ∈ (S : Subgroup G)) (ht : orderOf t = 2)
    (hclosed : ∀ g : G, g⁻¹ * t * g ∈ (S : Subgroup G) → g⁻¹ * t * g = t) :
    ∃ N : Subgroup G, N.Normal ∧ Odd (Nat.card N) ∧
      ∀ g : G, g * t * g⁻¹ * t⁻¹ ∈ N := sorry

/-- **The Brauer–Suzuki theorem** (Brauer–Suzuki, *On finite groups of even order whose 2-Sylow
group is a quaternion group*, 1959, p. 1757). If a Sylow `2`-subgroup `S` of `G` is generalized
quaternion of order `2 ^ n` with `n ≥ 3`, Mathlib's `QuaternionGroup (2 ^ (n - 2))` of order
`4 * 2 ^ (n - 2)`, then every involution `t` of `S` (there is exactly one) satisfies the existence
form of `t ∈ Z*(G)`. -/
theorem brauer_suzuki (S : Sylow 2 G) (n : ℕ) (hn : 3 ≤ n)
    (hS : Nonempty ((S : Subgroup G) ≃* QuaternionGroup (2 ^ (n - 2))))
    (t : G) (htS : t ∈ (S : Subgroup G)) (ht : orderOf t = 2) :
    ∃ N : Subgroup G, N.Normal ∧ Odd (Nat.card N) ∧
      ∀ g : G, g * t * g⁻¹ * t⁻¹ ∈ N := sorry

/-- The central-character criterion for membership in the principal `2`-block: `χ` is an
irreducible complex character of `G` and, for every `g`, the central-character value
`|Cl(g)| · χ(g) / χ(1)` is an algebraic integer congruent to `|Cl(g)|` modulo the ideal `m` of
the algebraic integers. For a maximal ideal `m` containing `2` this is the congruence of the central
character of `χ` with that of the trivial character, which Layer 3 of the README proves
equivalent to membership in the principal `2`-block of ModularCharactersAndBlocks. -/
def InPrincipalTwoBlock (m : Ideal (integralClosure ℤ ℂ)) (χ : G → ℂ) : Prop :=
  χ ∈ TauCeti.irreducibleCharacters ℂ G ∧ ∀ g : G,
    ∃ z : integralClosure ℤ ℂ,
      (z : ℂ) = (Nat.card (ConjClasses.mk g).carrier : ℂ) * χ g / χ 1 ∧
      z - (Nat.card (ConjClasses.mk g).carrier : integralClosure ℤ ℂ) ∈ m

/-- **Constancy of principal-block characters on the odd part of an involution section**
(Glauberman 1966, the principal-block lemma of the proof of Theorem 1; via Brauer's second and
third main theorems and the kernel theorem of ModularCharactersAndBlocks M5, M7, M8). If `χ` is an
irreducible character in the principal `2`-block, `s` is an involution and `N` is a normal subgroup
of odd order of the centralizer of `s`, then `χ (s * v) = χ s` for every `v ∈ N`. -/
theorem principalBlock_involution_section_constancy
    (m : Ideal (integralClosure ℤ ℂ)) (hm : m.IsMaximal) (h2 : (2 : integralClosure ℤ ℂ) ∈ m)
    (χ : G → ℂ) (hχ : InPrincipalTwoBlock m χ)
    (s : G) (hs : orderOf s = 2)
    (N : Subgroup (Subgroup.centralizer {s})) (hN : N.Normal)
    (hodd : Odd (Nat.card N)) (v : N) :
    χ (s * ((v : Subgroup.centralizer {s}) : G)) = χ s := sorry

end TauCetiRoadmap.GlaubermanZStar
